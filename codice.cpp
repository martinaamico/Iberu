
#include <iostream>
#include "/usr/include/postgresql/libpq-fe.h"

//#include "dependencies/include/libpq-fe.h"


#define PG_HOST	"127.0.0.1"
#define PG_USER	"rfabbian"  //modificare con il vostro user
#define PG_DB  	"iberu"  //modificare con il nome del db
#define PG_PASS	"password"  //modificare con la vostra password
#define PG_PORT	5432

using namespace std;

PGconn* connect() {
	char conninfo[256];
	sprintf(conninfo, "user=%s password=%s dbname=\'%s\' hostaddr=%s port=%d",
    	PG_USER, PG_PASS, PG_DB, PG_HOST, PG_PORT);


	PGconn* conn = PQconnectdb(conninfo);


	if (PQstatus(conn) != CONNECTION_OK) {
    	std::cerr << "Errore di connessione" << std::endl << PQerrorMessage(conn);
    	PQfinish(conn);
    	exit(1);
	}


	return conn;
}

PGresult* execute(PGconn* conn, const char* query) {
	PGresult* res = PQexec(conn, query);
	if (PQresultStatus(res) != PGRES_TUPLES_OK) {
    	std::cout << " Risultati inconsistenti!" << PQerrorMessage(conn) << std::endl;
    	PQclear(res);
    	exit(1);
	}


	return res;
}


void line(int campi, int* fieldLength) {
    for (int j = 0; j < campi; ++j) {
        cout << '+';
        for (int k = 0; k < fieldLength[j] + 2; ++k)
            cout << '-';
    }
    cout << "+\n";
}
void queryOutput(PGresult* res) {
    const int tuple = PQntuples(res), campi = PQnfields(res);
    int fieldLength[campi];
    string v[tuple + 1][campi];
    
    for (int i = 0; i < tuple; ++i)
        for (int j = 0; j < campi; ++j) {
            v[i + 1][j] = PQgetvalue(res, i, j);
            if (i == 0) {
            string s = PQfname(res, j);
            v[0][j] = s;
            }
        }

    for (int i = 0; i < campi; ++i) {
    	fieldLength[i] = 0;
        for (int j = 0; j < tuple + 1; ++j) {
            int size = v[j][i].size();
            fieldLength[i] = size > fieldLength[i] ? size : fieldLength[i];
        }
    }

    line(campi, fieldLength);
    for (int i = 0; i < tuple + 1; ++i) {
        for (int j = 0; j < campi; ++j) {
            cout << "| ";
            cout << v[i][j];
            for (int k = 0; k < fieldLength[j] - v[i][j].size() + 1; ++k)
                cout << ' ';
            if (j == campi - 1)
                cout << "|";
        }
        cout << endl;
    }
    line(campi, fieldLength);
}


std::string replaceString(std::string subject, const std::string& search,
                      	const std::string& replace) {
	size_t pos = 0;
	while ((pos = subject.find(search, pos)) != std::string::npos) {
     	subject.replace(pos, search.length(), replace);
     	pos += replace.length();
	}
	return subject;
}


std::string addParam(PGconn* conn, std::string query, const char* q, std::string table, unsigned int& count, bool multipleParams) {
  PGresult* res = execute(conn, q);
  queryOutput(res);
  const int tuple = PQntuples(res), campi = PQnfields(res);
  bool isFirstIteration = true;
  int val;
  count = 0;
  do {
	std::cout << "Inserire l'indice dell'elemento scelto: ";
	std::cin >> val;
	while (val < 0 || val >= tuple) {
  	std::cout << "Valore non valido\n";
  	std::cout << "Inserire l'indice dell'elemento scelto: ";
  	std::cin >> val;
	}
	if (val == 0)  multipleParams = false;
	else {
	count += 1;
  	if (!isFirstIteration && multipleParams) query = replaceString(query, "<<>>", " OR " + table + ".id_" + table + "=<<>>");
  	query = replaceString(query, "<<>>" , PQgetvalue(res, val - 1, 0));
	}
	isFirstIteration = false;
  } while (multipleParams);
  query = replaceString(query, "<<>>" , "");
  return query;
}


int main(int argc, char** argv) {
  PGconn* conn = connect();
  PGresult * res;
  std::string query[7] = {
	"SELECT r.nome_ricetta, r.peso_finale, r.durata_preparazione, r.durata_cottura, r.procedimento, r.difficolta \
  	FROM ricetta r \
  	JOIN contenente c \
  	ON r.nome_ricetta = c.nome_ricetta \
  	WHERE c.id_alimento = <<>> \
  	GROUP BY r.nome_ricetta \
  	HAVING COUNT(*) = !!!! \
  	ORDER BY r.difficolta DESC",
	"SELECT al.nome_alimento, COUNT(*) AS migliori \
  	FROM Segue s \
  	JOIN Dieta d \
  	ON s.nome_dieta = d.nome_dieta \
  	JOIN Appartenente a \
  	ON d.nome_dieta = a.nome_dieta \
  	JOIN Alimento al \
  	ON al.id_alimento = a.id_alimento \
  	WHERE s.nome_dieta = '<<>>' \
  	GROUP BY al.nome_alimento \
  	ORDER BY migliori DESC;",
	"SELECT u.nome, u.cognome, ROUND(us.media_riposo, 2) AS media_riposo_utente, \
  	ROUND(usa.media_add, 2) AS media_add, ROUND(usl.media_sl, 2) AS media_sl, \
  	ROUND(usp.media_sp, 2) AS media_sp, ROUND(uspe.media_spe, 2) AS media_spe, \
  	ROUND(usr.media_r, 2) AS media_r \
  	FROM utente u \
  	JOIN sonno s \
  	ON s.id_utente = u.id_utente \
  	JOIN (SELECT u.id_utente, AVG(s.durata_riposo) AS media_riposo \
  	FROM sonno s JOIN utente u ON u.id_utente = s.id_utente \
  	WHERE u.id_utente = <<>> GROUP BY u.id_utente) AS us \
  	ON us.id_utente = u.id_utente \
  	JOIN (SELECT u.id_utente, AVG(s.durata_fase) AS media_add \
  	FROM suddiviso s JOIN utente u ON u.id_utente = s.id_utente \
  	WHERE tipologia_fase = 'Stadio1:addormentamento' AND u.id_utente = <<>> \
  	GROUP BY u.id_utente) AS usa \
  	ON usa.id_utente = u.id_utente \
  	JOIN (SELECT u.id_utente, AVG(s.durata_fase) AS media_sl \
  	FROM suddiviso s JOIN utente u ON u.id_utente = s.id_utente \
  	WHERE tipologia_fase = 'Stadio2:sonno_leggero' AND u.id_utente = <<>> \
  	GROUP BY u.id_utente) AS usl \
  	ON usl.id_utente = u.id_utente \
  	JOIN (SELECT u.id_utente, AVG(s.durata_fase) AS media_sp \
  	FROM suddiviso s JOIN utente u ON u.id_utente = s.id_utente \
  	WHERE tipologia_fase = 'Stadio3:sonno_profondo' AND u.id_utente = <<>> \
  	GROUP BY u.id_utente) AS usp \
  	ON usp.id_utente = u.id_utente \
  	JOIN (SELECT u.id_utente, AVG(s.durata_fase) AS media_spe \
  	FROM suddiviso s JOIN utente u ON u.id_utente = s.id_utente \
  	WHERE tipologia_fase = 'Stadio4:sonno_profondo_effettivo' AND u.id_utente = <<>> \
  	GROUP BY u.id_utente) AS uspe \
  	ON uspe.id_utente = u.id_utente \
  	JOIN (SELECT u.id_utente, AVG(s.durata_fase) AS media_r \
  	FROM suddiviso s JOIN utente u ON u.id_utente = s.id_utente \
  	WHERE tipologia_fase = 'Stadio5:fase_rem' AND u.id_utente = <<>> \
  	GROUP BY u.id_utente) AS usr \
  	ON usr.id_utente = u.id_utente \
  	GROUP BY u.nome, u.cognome, us.media_riposo, usa.media_add, usl.media_sl, \
  	usp.media_sp, uspe.media_spe, usr.media_r;",
	"SELECT r.nome_ricetta \
  	FROM ricetta r \
  	WHERE r.nome_ricetta NOT IN \
  	(SELECT r.nome_ricetta \
  	FROM ricetta r \
  	JOIN contenente c ON r.nome_ricetta = c.nome_ricetta \
  	JOIN alimento a ON a.id_alimento = c.id_alimento \
  	JOIN appartenente ap ON ap.id_alimento = a.id_alimento \
  	GROUP BY r.nome_ricetta) \
  	GROUP BY r.nome_ricetta;",
	"SELECT u.nome, u.cognome, \
  	(SELECT p.nome_esercizio \
  	FROM utente u1 \
  	JOIN allenamento a ON u1.id_utente = a.id_utente \
  	JOIN composto c ON a.id_allenamento = c.id_allenamento \
  	JOIN pesistica p ON c.nome_esercizio = p.nome_esercizio \
  	WHERE u1.genere = <<>> AND u1.id_utente = u.id_utente \
  	GROUP BY p.nome_esercizio \
  	ORDER BY COUNT(*) DESC \
  	LIMIT 1) AS esercizio_preferito, \
  	(SELECT c.nome_movimento \
  	FROM utente u3 \
  	JOIN allenamento a ON u3.id_utente = a.id_utente \
  	JOIN formato f ON a.id_allenamento = f.id_allenamento \
  	JOIN cardiovascolare c ON f.nome_movimento = c.nome_movimento \
  	WHERE u3.genere = <<>> AND u3.id_utente = u.id_utente \
  	GROUP BY c.nome_movimento \
  	ORDER BY COUNT(*) DESC \
  	LIMIT 1) AS movimento_preferito \
  	FROM utente u \
  	WHERE u.genere = <<>>;",
	"SELECT u.nome, u.cognome, p.peso as peso_iniziale, s.peso_obiettivo, \
  	ROUND(AVG(pp.peso), 2) as peso_medio, \
  	ROUND(AVG(pp.perdita_peso), 3) as perdita_peso_misurazioni \
  	FROM utente u \
  	JOIN segue s ON u.id_utente = s.id_utente \
  	JOIN (SELECT *, peso - LAG(peso, 1) OVER(PARTITION BY id_utente ORDER BY data_misurazione) perdita_peso \
  	FROM peso \
  	WHERE data_misurazione > <<>> \
  	ORDER BY data_misurazione) pp ON pp.id_utente = u.id_utente \
  	JOIN (SELECT row_number() OVER(PARTITION BY id_utente order by data_misurazione) as row, id_utente, peso \
  	FROM peso \
  	WHERE data_misurazione > <<>>) p ON p.id_utente = u.id_utente \
  	WHERE p.row = 1 \
  	GROUP BY u.nome, u.cognome, p.peso, s.peso_obiettivo;",
	"SELECT COUNT(*) AS totale_utenti, \
   	ROUND(AVG(un.calorie), 2) AS media_calorie, \
   	ROUND(AVG(un.carboidrati), 0) AS media_carboidrati, \
   	ROUND(AVG(un.proteine), 0) AS media_proteine,\
   	ROUND(AVG(un.grassi), 0) AS media_grassi\
    FROM (SELECT u.id_utente, \
         	AVG(p.calorie_pasto) AS calorie, \
         	AVG(p.carboidrati_pasto) AS carboidrati, \
         	AVG(p.proteine_pasto) AS proteine, \
         	AVG(p.grassi_pasto) AS grassi\
  	FROM utente u \
  	JOIN pasto AS p\
  	ON p.id_utente = u.id_utente\
  	WHERE u.genere=<<>>\
  	GROUP BY u.id_utente) AS un"

  };


  bool check = true;
  unsigned int index;
  unsigned int count;
  std::string q;


  while(check) {
	std::cout << std::endl;
    	std::cout << "1. Mostrare tutte le ricette che utilizzano gli ingredienti inseriti dall’utente\n";
    	std::cout << "2. Per la dieta inserita dall'utente visualizzare quali sono i cibi più usati in ordine di utilizzo \n";
    	std::cout << "3. Visualizzare la durata media del sonno e delle relative 5 fasi di un utente inserito\n";
    	std::cout << "4. Mostrare tutte le ricette che hanno alimenti che non appartengono a nessuna dieta\n";
    	std::cout << "5. Restituire nome, cognome, esercizio preferito e movimento preferito per gli utenti del genere scelto\n";
    	std::cout << "6. Visualizza nome, cognome, peso iniziale, peso obiettivo, peso medio e perdita di peso media misurata dalla data inserita ad oggi per ciascun utente \n";
    	std::cout << "7. Restituisce gli utenti del genere scelto con più allenamenti a settimana e media dei valori nutrizionali \n";
    	 
    	std::cout << "Query da eseguire (0 per uscire): ";




	std::cin >> index;
	if (index == 0){
  	check = false;
  	break;
	}


	while (index < 0 || index > 7) {
  	std::cout << "Reinserire la query scelta: ";
  	std::cin >> index;
	}


	std::string genere;
	std::string date;
	switch (index) {
  	case 0:
    	check = false;
    	break;
  	case 1:
    	q = addParam(conn, query[0], "SELECT id_alimento, nome_alimento FROM alimento", "alimento", count, true);
    	q = replaceString(q, "!!!!", to_string(count));
    	res = execute(conn, q.c_str());
    	queryOutput(res);
    	break;
  	case 2:
    	q = addParam(conn, query[1], "SELECT nome_dieta FROM dieta", "dieta", count, false);
    	res = execute(conn, q.c_str());
    	queryOutput(res);
    	break;
  	case 3:
    	q = addParam(conn, query[2], "SELECT id_utente, nome, cognome FROM utente", "utente", count, false);
    	res = execute(conn, q.c_str());
    	queryOutput(res);
    	break;
  	case 4:
    	res = execute(conn, query[3].c_str());
    	queryOutput(res);
    	break;
	case 5:
        std::cout << "Scegliere una genere (M/F): ";
        std::cin >> genere;
        if (genere == "M") genere = "true";
        else genere = "false";
        q = replaceString(query[4], "<<>>", genere);
        res = execute(conn, q.c_str());
        queryOutput(res);
        break;
      	case 6:
        std::cout << "Scegliere una data nel formato YYYY-MM-dd: ";
        std::cin >> date;
        q = replaceString(query[5], "<<>>", "'" + date + "'");
        res = execute(conn, q.c_str());
        queryOutput(res);
        break;
        case 7:
        std::cout << "Scegliere una genere (M/F): ";
        std::cin >> genere;
        if (genere == "M") genere = "true";
        else genere = "false";
        q = replaceString(query[6], "<<>>", genere);
    	res = execute(conn, q.c_str());
    	queryOutput(res);
    	break;
	}
	std::cin.ignore();
	std::cout << "Press any key to continue...";
	std::cin.get();
	system("cls");
	system("clear");
  }
  system("clear");
  PQfinish(conn);
}


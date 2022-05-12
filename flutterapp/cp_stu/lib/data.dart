import 'package:postgres/postgres.dart';


class db
{

  var id;
  var name;

  Future<void> postgres()
  async {
  var databaseConnection = PostgreSQLConnection(
    "localhost", 5432, "cpen",
    queryTimeoutInSeconds: 3600,
    timeoutInSeconds: 3600,
    username: 'postgres',
    password: 'Superman36');

  await databaseConnection.open();
  initDatabaseConnection() async {
     await databaseConnection.open().then((value) {
      print("Database Connected!");
    });
  }
  List<Map<String, Map<String, dynamic>>> result = await  databaseConnection
  .mappedResultsQuery("SELECT name, id FROM public.student;");
  for (final row in result) {
  id = row["id"];
  name = row["name"];

}
}
}//postgres

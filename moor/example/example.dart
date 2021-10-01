import 'package:moor/moor.dart';
import 'table.dart';

part 'example.g.dart';

// Define tables that can model a database of recipes.

class Recipes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(max: 16)();
  TextColumn get instructions => text()();
  IntColumn get category => integer().nullable()();
}

class Test {

}

class Te extends Test {

}

class Ingredients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get caloriesPer100g => integer().named('calories')();
}

class IngredientInRecipes extends Table {
  @override
  String get tableName => 'recipe_ingredients';

  // We can also specify custom primary keys
  @override
  Set<Column> get primaryKey => {recipe, ingredient};

  IntColumn get recipe => integer()();
  IntColumn get ingredient => integer()();

  IntColumn get amountInGrams => integer().named('amount')();
}

@UseMoor(
  tables: [CategoriesTable, Recipes],
  // queries: {
  //   // query to load the total weight for each recipe by loading all ingredients
  //   // and taking the sum of their amountInGrams.
  //   // 'totalWeight': '''
  //   //   SELECT r.title, SUM(ir.amount) AS total_weight
  //   //     FROM recipes r
  //   //     INNER JOIN recipe_ingredients ir ON ir.recipe = r.id
  //   //   GROUP BY r.id
  //   //  '''
  // },
)

class Database extends _$Database {
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        // populate data
        await into(categoriesTable)
            .insert(CategoriesTableCompanion.fromRowClass(Categories()));
      },
    );
  }
}

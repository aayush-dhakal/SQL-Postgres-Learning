const request = require("supertest");
const buildApp = require("../../app");
const UserRepo = require("../../repos/user-repo");
const pool = require("../../pool");
const Context = require("../context");

let context;
beforeAll(async () => {
  // before running any tests connect to db and run migrations for initial setup
  context = await Context.build();
});

beforeEach(async () => {
  // delete all the rows inside the table before running each tests
  await context.reset();
});

afterAll(() => {
  // delete the test roles and disconnect from the db
  return context.close();
});

it("create a user", async () => {
  const startingCount = await UserRepo.count();

  await request(buildApp())
    .post("/users")
    .send({ username: "testuser", bio: "test bio" })
    .expect(200);

  const finishCount = await UserRepo.count();
  expect(finishCount - startingCount).toEqual(1);
});

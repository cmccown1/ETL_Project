CREATE TABLE consumer_debt (
    year               INT     NOT NULL,
    state              VARCHAR NOT NULL,
    population         BIGINT,
	auto               BIGINT,
    creditcard         BIGINT,
    mortgage           BIGINT,
    studentloan        BIGINT,
    total              BIGINT,
    auto_delinq        FLOAT8,
    creditcard_delinq  FLOAT8,
    mortgage_delinq    FLOAT8,
    studentloan_delinq FLOAT8,
    PRIMARY KEY (year, state)
);

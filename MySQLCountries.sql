USE world;

-- 1. What query would you run to get all the countries that speak Slovene? 
-- Your query should return the name of the country, language and language percentage.
-- Your query should arrange the result by language percentage in descending order.
SELECT countries.name,languages.language, languages.percentage
FROM countries
JOIN languages ON countries.id = languages.country_id
WHERE languages.language = 'Slovene' 
ORDER BY languages.percentage DESC;

-- 3. What query would you run to get all the cities in Mexico with a population of greater than 500,000? 
-- Your query should arrange the result by population in descending order. 
SELECT cities.name, cities.population
FROM countries
JOIN cities ON countries.id = cities.country_id
WHERE countries.name = 'Mexico' AND cities.population > 500000
ORDER BY cities.population DESC;

-- 4. What query would you run to get all languages in each country with a percentage greater than 89%? 
-- Your query should arrange the result by percentage in descending order. 
SELECT countries.name,languages.language, languages.percentage
FROM countries
JOIN languages ON countries.id = languages.country_id
WHERE languages.percentage > 89 
ORDER BY languages.percentage DESC;

-- 6. What query would you run to get countries with only Constitutional Monarchy 
-- with a capital greater than 200 and a life expectancy greater than 75 years? 
SELECT name
FROM countries
WHERE government_form = 'Constitutional Monarchy' 
AND capital > 200 
AND life_expectancy > 75;

-- 5. What query would you run to get all the countries with Surface Area below
-- 501 and Population greater than 100,000? 
SELECT name
FROM countries
WHERE surface_area < 501 
AND population > 100000;

-- 7. What query would you run to get all the cities of Argentina inside the Buenos Aires 
-- district and have the population greater than 500, 000? The query should return the 
-- Country Name, City Name, District and Population. 
SELECT countries.name,cities.name,cities.district,cities.population
FROM countries
JOIN cities ON countries.id = cities.country_id
WHERE countries.name = 'Argentina' 
AND cities.district = 'Buenos Aires'
AND cities.population > 500000; 

-- 8. What query would you run to summarize the number of countries in each region? 
-- The query should display the name of the region and the number of countries. 
-- Also, the query should arrange the result by the number of countries in descending order.
SELECT region,COUNT(*) as NrOfCountries
FROM countries
GROUP BY region
ORDER BY NrOfCountries DESC;
 
-- 2. What query would you run to display the total number of cities for each country? 
-- Your query should return the name of the country and the total number of cities. 
-- You query should arrange the result by the number of cities in descending order.
SELECT countries.name,COUNT(*) as NrOfCities
FROM cities
LEFT JOIN countries on cities.country_id = countries.id
GROUP BY countries.name
ORDER BY NrOfCities DESC;
install.packages("devtools")
install.packages("dplyr")
install.packages("chromote")
install_github("JaseZiv/worldfootballR")

library(devtools)
library(dplyr)
library(chromote)
library(worldfootballR)


################################################################################

# load the team-level statistics for the top 5 European leagues
big5_standard <- fb_big5_advanced_season_stats(season_end_year= c(2019:2024), 
                                               stat_type= "standard", 
                                               team_or_player= "team")

# filter to only include the Premier League, and rename all statistics for further analysis
pl_standard <- big5_standard %>%
  filter(Comp == "Premier League" & Team_or_Opponent == "team") %>%
  select(-Comp, -Num_Players, -Team_or_Opponent, -Url) %>%
  rename("Year" = "Season_End_Year", "G_plus_A" = "G+A", "npxG_plus_xAG_Expected" = "npxG+xAG_Expected",
         "Gls_Per_90" = "Gls_Per", "Ast_Per_90" = "Ast_Per",
         "G_plus_A_Per_90" = "G+A_Per", "G_minus_PK_Per_90" = "G_minus_PK_Per", 
         "G_plus_A_minus_PK_Per_90" = "G+A_minus_PK_Per", "xG_Per_90" = "xG_Per",
         "xAG_Per_90" = "xAG_Per", "xG_plus_xAG_Per_90" = "xG+xAG_Per",
         "npxG_Per_90" = "npxG_Per", "npxG_plus_xAG_Per_90" = "npxG+xAG_Per")

# save the team-level statistics and export the dataset
View(pl_standard)
write.csv(pl_standard, "teams_preprocessed.csv", row.names = FALSE)

################################################################################

# download the 2020 transfer market values for all players in the Premier League
values_2020 <- tm_player_market_values(country_name = "England",
                                                      start_year = 2020)

# filter to only include the player name and their market value
values_2020 <- values_2020 %>%
  select(player_name, market_value_euro = player_market_value_euro)

View(values_2020)


# download the 2020 player-level statistics for all Premier League players
standard_2020 <- fb_league_stats(
  country = "ENG",
  gender = "M",
  season_end_year = 2020,
  tier = "1st",
  non_dom_league_url = NA,
  stat_type = "standard",
  team_or_player = "player"
)

# filter out non-team-level statistics to further assist analytic cleanliness
standard_2020 <- standard_2020 %>%
  select(-Player_Href, -Matches, -url) %>%
  rename(player_name = Player)

View(standard_2020)

# append player transfer market values to their corresponding statistics
players_2020 <- standard_2020 %>%
  left_join(values_2020, by = "player_name", relationship = "many-to-many") %>%
  mutate(Year = 2020)

# save the player-level statistics and export the dataset
View(players_2020)
write.csv(players_2020, "players_2020.csv", row.names = FALSE)

#################################

# download the 2021 transfer market values for all players in the Premier League
values_2021 <- tm_player_market_values(country_name = "England",
                                       start_year = 2021)

# filter to only include the player name and their market value
values_2021 <- values_2021 %>%
  select(player_name, market_value_euro = player_market_value_euro)

# download the 2021 player-level statistics for all Premier League players
standard_2021 <- fb_league_stats(
  country = "ENG",
  gender = "M",
  season_end_year = 2021,
  tier = "1st",
  non_dom_league_url = NA,
  stat_type = "standard",
  team_or_player = "player"
)

# filter out non-team-level statistics to further assist analytic cleanliness
standard_2021 <- standard_2021 %>%
  select(-Player_Href, -Matches, -url) %>%
  rename(player_name = Player)

# append player transfer market values to their corresponding statistics
players_2021 <- standard_2021 %>%
  left_join(values_2021, by = "player_name", relationship = "many-to-many") %>%
  mutate(Year = 2021)

# save the player-level statistics and export the dataset
View(players_2021)
write.csv(players_2021, "players_2021.csv", row.names = FALSE)

#################################

# download the 2022 transfer market values for all players in the Premier League
values_2022 <- tm_player_market_values(country_name = "England",
                                       start_year = 2022)

# filter to only include the player name and their market value
values_2022 <- values_2022 %>%
  select(player_name, market_value_euro = player_market_value_euro)

# download the 2022 player-level statistics for all Premier League players
standard_2022 <- fb_league_stats(
  country = "ENG",
  gender = "M",
  season_end_year = 2022,
  tier = "1st",
  non_dom_league_url = NA,
  stat_type = "standard",
  team_or_player = "player"
)

# filter out non-team-level statistics to further assist analytic cleanliness
standard_2022 <- standard_2022 %>%
  select(-Player_Href, -Matches, -url) %>%
  rename(player_name = Player)

# append player transfer market values to their corresponding statistics
players_2022 <- standard_2022 %>%
  left_join(values_2022, by = "player_name", relationship = "many-to-many") %>%
  mutate(Year = 2022)

# save the player-level statistics and export the dataset
View(players_2022)
write.csv(players_2022, "players_2022.csv", row.names = FALSE)

#################################

# download the 2023 transfer market values for all players in the Premier League
values_2023 <- tm_player_market_values(country_name = "England",
                                       start_year = 2023)

# filter to only include the player name and their market value
values_2023 <- values_2023 %>%
  select(player_name, market_value_euro = player_market_value_euro)

# download the 2023 player-level statistics for all Premier League players
standard_2023 <- fb_league_stats(
  country = "ENG",
  gender = "M",
  season_end_year = 2023,
  tier = "1st",
  non_dom_league_url = NA,
  stat_type = "standard",
  team_or_player = "player"
)

# filter out non-team-level statistics to further assist analytic cleanliness
standard_2023 <- standard_2023 %>%
  select(-Player_Href, -Matches, -url) %>%
  rename(player_name = Player)

# append player transfer market values to their corresponding statistics
players_2023 <- standard_2023 %>%
  left_join(values_2023, by = "player_name", relationship = "many-to-many") %>%
  mutate(Year = 2023)

# save the player-level statistics and export the dataset
View(players_2023)
write.csv(players_2023, "players_2023.csv", row.names = FALSE)

#################################

# download the 2024 transfer market values for all players in the Premier League
values_2024 <- tm_player_market_values(country_name = "England",
                                       start_year = 2024)

# filter to only include the player name and their market value
values_2024 <- values_2024 %>%
  select(player_name, market_value_euro = player_market_value_euro)

# download the 2024 player-level statistics for all Premier League players
standard_2024 <- fb_league_stats(
  country = "ENG",
  gender = "M",
  season_end_year = 2024,
  tier = "1st",
  non_dom_league_url = NA,
  stat_type = "standard",
  team_or_player = "player"
)

# filter out non-team-level statistics to further assist analytic cleanliness
standard_2024 <- standard_2024 %>%
  select(-Player_Href, -Matches, -url) %>%
  rename(player_name = Player)

# append player transfer market values to their corresponding statistics
players_2024 <- standard_2024 %>%
  left_join(values_2022, by = "player_name", relationship = "many-to-many") %>%
  mutate(Year = 2024)

# save the player-level statistics and export the dataset
View(players_2024)
write.csv(players_2024, "players_2024.csv", row.names = FALSE)

#################################

# combine all player statistics across years into a single dataset
players <- bind_rows(players_2020, players_2021, players_2022, players_2023, players_2024)

# rename all columns to match those in the team-level dataset for analytic cleanliness
players <- players %>%
  rename("Player" = "player_name", "MP_Playing" = "MP_Playing.Time", "Starts_Playing" = "Starts_Playing.Time",
         "Min_Playing" = "Min_Playing.Time", "Mins_Per_90_Playing" = "Mins_Per_90_Playing.Time",
         "G_plus_A" = "G.A", "npxG_plus_xAG_Expected" = "npxG.xAG_Expected", "Gls_Per_90" = "Gls_Per.90.Minutes",
         "Ast_Per_90" = "Ast_Per.90.Minutes", "G_plus_A_Per_90" = "G.A_Per.90.Minutes",
         "G_minus_PK_Per_90" = "G_minus_PK_Per.90.Minutes", "G_plus_A_minus_PK_Per_90" = "G.A_minus_PK_Per.90.Minutes",
         "xG_Per_90" = "xG_Per.90.Minutes", "xAG_Per_90" = "xAG_Per.90.Minutes", 
         "xG_plus_xAG_Per_90" = "xG.xAG_Per.90.Minutes", "npxG_Per_90" = "npxG_Per.90.Minutes",
         "npxG_plus_xAG_Per_90" = "npxG.xAG_Per.90.Minutes")

# save the finished player-level statistics dataset
View(players)

# remove rows with N/A in the "Market_Value_Euro" column
players_preprocessed <- players[!is.na(players$Market_Value_Euro), ]

# check the updated dataset
cat("Updated number of rows in the dataset:", nrow(players_preprocessed), "\n")

na_count <- sum(is.na(players_preprocessed$Market_Value_Euro))

# count total rows in the dataset
total_rows <- nrow(players_preprocessed)

# print the results
cat("Rows with N/A in 'Market_Value_Euro':", na_count, "\n")
cat("Total rows in the dataset:", total_rows, "\n")

# export the dataset
write.csv(players_preprocessed, "players_preprocessed_cleaned.csv", row.names = FALSE)

glimpse(teams_preprocessed)
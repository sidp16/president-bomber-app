const APP_TITLE = 'Two Rooms and a Boom!';
const JOIN_GAME_TEXT_FIELD_HINT = "Game ID";
const NO_GAME_ID_MESSAGE = "No Game ID found...";
const LOADING_MESSAGE = 'Loading data...';
const COLLECTION_NAME = 'data';
const PLAYERS = 'players';
const ROLES = 'roles';
const BACK_BUTTON_MESSAGE = 'Go back';
const JOIN_GAME_BUTTON_MESSAGE = 'Join Game';
const CREATE_GAME_BUTTON_MESSAGE = 'Create Game';
const NAME_TEXT_FIELD_HINT = 'Name';
const GAMBLER = 'Gambler';
const SNIPER = 'Sniper';
const HERO = 'Hero';
const DECOY = 'Decoy';
const TARGET = 'Target';
const TELEPATH = 'Telepath';
const MASTERMIND = 'Mastermind';
const ANARCHIST = 'Anarchist';
const HOTPOTATO = 'Hot Potato';
const TRAVELER = 'Traveler';
const CLEAR = 'Clear\nRoles';
const BLUE = 'Blue';
const RED = 'Red';
const PRESIDENT = 'President';
const BOMBER = 'Bomber';
const DISTRIBUTE_ROLES_BUTTON_TEXT = 'Give Roles';
const START_GAME_BUTTON_TEXT = 'Start Game';
const LEAVE_GAME = 'Home / Leave Game';
const NUMBER_OF_ROLES_MESSAGE = ' roles in game';
const IN_LOBBY_MESSAGE = ' player in lobby / ';
const DISTRIBUTIONS = 'distributions';
const RULES_CHARACTERS_SCREEN_TITLE = 'Characters & Rules';
const CHARACTERS = 'Characters';
const RULES = 'Rules';
const ABOUT = 'About';
const REPORT = 'Report';
const GAME_END = "gameEnd";
const GAME_START = "gameStart";
const WAITING_FOR_TIMER_MESSAGE = "Waiting for creator to start!";
const WAITING_FOR_DISTRIBUTION_MESSAGE = "Waiting for creator to distribute!";
const OWNER = 'owner';
const LOADING_TIMER_MESSAGE = 'Loading...';
const STOP_GAME_BOOL = 'stopGamePress';
const END_GAME_BUTTON_TEXT = 'End Game';
const WELCOME_APP_MESSAGE = "Welcome to \nTwo Rooms And a Boom!";
const JOIN_GAME_HELP_MESSAGE =
    'Join a game - Type your name, enter a Game ID and press join game!';
const CREATE_GAME_HELP_MESSAGE =
    'Create a game - Type your name and press create game!';
const HELP_BOX_TITLE = 'How To:';
const GAME_ID_HELP_MESSAGE =
    "Find the game ID - Once you've created / joined a game, look at the top left of the screen!";
const List ALL_ROLES = [
  'Bomber',
  'President',
  'Red Hostage',
  'Blue Hostage',
  'Gambler',
  'Sniper',
  'Target',
  'Decoy',
  'Mastermind',
  'Hot Potato',
  'Hero',
  'Anarchist',
  'Traveler'
];

const List ROLE_DESCRIPTIONS = [
  'Your allegiance is Red. \n\nYour aim is to kill the president by being in the same room as them at the end of the last round, and if you succeed, the red team wins.',
  'Your allegiance is Blue. \n\nProvided you are in a different room to the Bomber at the end of the last round, the blue team wins, as you are alive.',
  'Your allegiance is Red. \n\nYour role is to aid the Bomber in his attempt to kill the president by being in the same room as them at the end of the last round.',
  'Your allegiance is Blue. \n\nYour role is to aid the President in his bid to be in the opposite room as the Bomber at the end of the last round.',
  'You have no allegiance. \n\nYour role is to guess who will win at the end of the game after the last swap has been made, and if you are correct, you win along with the winning party.',
  'You have no allegiance. At the end of the last round, before all players reveal their character cards, you must publicly announce which player you are shooting.\n\nThe selected player does not have to be in the same room as you. You win if you kill the Target along with the winning party. Kill anyone else and you lose.',
  'You have no allegiance. \n\nYou win if the Sniper does not shoot you at the end of the last round along with the other winning party.',
  'You have no allegiance. \n\nYou win if the Sniper shoots you at the end of the last round along with the other winning party.',
  'You have no allegiance. \n\nAt the end of the last round, before all players reveal their cards, you, the Mastermind, must publicly announce the color of EVERY player. If you are exactly right, you win and everyone else loses.',
  'You have no allegiance. Any player that card shares or even color shares with you immediately trades cards with you.\n\nBoth you and the other player assume the powers and the allegiance of the newly acquired cards. At the end of the game, the Hot Potato loses.',
  'You have no allegiance. \n\nYou win if you are in the same room as the President and Bomber at the end of the game. If you win, the both Red and Blue teams lose.',
  'You have no allegiance. \n\nYou win if you are able to gain leader status in a majority of the rounds. Hence, you would have to be leader 2 times in a 3 round game.',
  'You have no allegiance. \n\nYou win if you are sent to a different room as a hostage at the end of MOST rounds. Hence, you would have to be moved 2 times in a 3 round game.',
];

const List INFORMATION_TILES = [
  'Members and Roles',
  'Players in Game',
  'Roles in Game',
  'Your Role',
  'Timer'
];

const List FUNNY_MESSAGES = [
  "I’m not superstitious, but I am a little stitious.",
  "Occasionally i'll hit somebody with my car. So sue me.",
  "I DECLARE BANKRUPTCYYY!",
  "Well well well, how the turned tables...",
  "Well, just tell him to call me as ASAP as possible.",
  'You know what they say, "Fool me once, strike one, but fool me twice...strike three."',
  "Too much change is not a good thing. Ask the climate.",
  "Wish I could, but I can't. Well can. But won't. Should, maybe, but shorn't.",
  "The worst thing about prison was the Dementors.",
  "Love inside jokes. Would love to be a part of one someday.",
  "I learned that a while back that if I don't text 911, people will not return my calls.",
  "I knew exactly what to do. But in a much more real sense, I had no idea what to do.",
  "Saw Inception. Or at least I dreamt I did.",
  "Seems awfully mean. But sometimes the ends justify the mean."
];

const RULES_TITLES = [
  'Setup',
  'Rules',
  'Win Conditions',
  'Rounds + Leaders',
  'Leader Change',
  'End of Round',
  'Advanced Rules',
];
const RULES_PAGE_SUBTEXT = [
  '''
In Two Rooms and a Boom there are 2 teams, 2 rooms and a minimum of 6 players going up to 30. The 2 teams are the Blue Team and the Red Team (plus maybe some special / unique roles who don't have an alliegance). The Blue Team has a President. The Red Team has a Bomber.\n
Players are first equally distributed between 2 separate playing areas (usually 2 separate rooms) and then each player is randomly dealt a character card. Players play the game by saying what they want in order to select a leader for their room. The leader chooses hostage(s) (players who will be sent to the other room at the end of the round).
''',
  '''
1. TIME IS PUBLIC.
Round time can be kept by anyone with a stopwatch. Time is never kept secret. The end of a round should be clear to all players.

2. NO COMMUNICATION BETWEEN ROOMS.
No yelling anything to players in the other room. No eavesdropping. Even if you can see into the other room, there is no sign language permitted.

3. YOUR CARD.
Do what you want with your character card. Show it to someone, everyone, or nobody.
''',
  '''
After the last hostage exchange, the game ends. Everyone reveals their cards (unless you are playing with special role(s)).

If the President is in the room with the Bomber, then the entire Red Team wins.

If the President is not in the room with the Bomber, then the entire Blue Team wins.

Look at the Characters Page to see the win conditions of the other characters in the game.
  ''',
  '''
The game consists of 3 timed rounds (a universal timer that accounts for both rooms). Each round is shorter than the previous round. At the end of each round, the hostages selected by the leaders will be traded into opposing rooms. The game ends after the last hostage exchange. Everyone reveals their card.

The leader is the player who holds the leader card and chooses the hostages to leave the room at the end of the round & cannot choose themself.

The first leader of a room is the player who is appointed by another player. To appoint a player, point to them and say, "I appoint you as leader!" A player can never appoint themselves. 
  ''',
  '''
Want a different leader? Here are the 2 ways to do that!

1. Leader Abdicates.
If you are leader and don't want to be (usually because you want to be a hostage), then simply hand the leader card to a willing player. The player may accept or refuse leadership, but if they do accept leadership, you can't become leader again until the next round.

2. Leader Is Usurped.
If there is still time in a round and you want a different leader, raise one hand into the air (so your usurping attempt is clearly visible) and point your other hand toward the player you want as the new leader.
  ''',
  '''
At the end of every round, the room leaders must perform the following 3 steps in order:

1. Indicate your hostage selection to the players in your room. Players in your room need to know who was selected as hostages because you can't change your mind once hostages are selected and you can't choose yourself.

2. Leaders parley by meeting between the 2 rooms without hostages, exchange the hostages and return to their respective room (provided this isn't the last round).

3. Start the universal timer again if there are more rounds to be played.
  ''',
  '''
1. Showing Colors
If you have more than 10 players, players are no longer limited to revealing their entire card. Instead, players may choose to reveal only part of their card.

2. More Characters
You can play with advanced character cards that modify the basic rules of the game. If an advanced character card contradicts a basic game rule, then the advanced character s rule should be followed.

3. More Rounds
Try adding a 5 minute round and a 4 minute round, but only if you have more than 10 players. If you don't have enough players, stick with 3 rounds
  ''',
];

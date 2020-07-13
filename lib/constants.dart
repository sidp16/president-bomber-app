const APP_TITLE = 'President & Bomber!';
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
const CLEAR = 'Clear Roles';
const BLUE = 'Blue';
const RED = 'Red';
const PRESIDENT = 'President';
const BOMBER = 'Bomber';
const DISTRIBUTE_ROLES_BUTTON_TEXT = 'Distribute';
const LEAVE_GAME = 'Leave Game';
const NUMBER_OF_ROLES_MESSAGE = ' roles in game';
const IN_LOBBY_MESSAGE = ' in lobby / ';
const DISTRIBUTIONS = 'distributions';
const RULES_CHARACTERS_SCREEN_TITLE = 'Characters & Rules';
const CHARACTERS = 'Characters';
const RULES = 'Rules';
const GAME_END = "gameEnd";
const WAITING_FOR_TIMER_MESSAGE = "Waiting for creator to start!";
const WAITING_FOR_DISTRIBUTION_MESSAGE = "Waiting for creator to distribute!";
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
  'Your allegiance is RED. Your aim is to kill the president by being in the same room as them at the end of the last round, and if you succeed, the red team wins.',
  'Your allegiance is BLUE. Provided you are in a different room to the Bomber at the end of the last round, the blue team wins, as you are alive.',
  'Your allegiance is RED. Your role is to aid the Bomber in his attempt to kill the president by being in the same room as them at the end of the last round.',
  'Your allegiance is BLUE. Your role is to aid the President in his bid to be in the opposite room as the Bomber at the end of the last round.',
  'You have no allegiance. Your role is to guess who will win at the end of the game after the last swap has been made, and if you are correct, you win along with the winning party.',
  'You have no allegiance. At the end of the last round, before all players reveal their character cards, you must publicly announce which player you are shooting.\n\nThe selected player does not have to be in the same room as you. You win if you kill the Target along with the winning party. Kill anyone else and you lose.',
  'You have no allegiance. You win if the Sniper does not shoot you at the end of the last round along with the other winning party',
  'You have no allegiance. You win if the Sniper shoots you at the end of the last round along with the other winning party.',
  'You have no allegiance. At the end of the last round, before all players reveal their cards, you, the Mastermind, must publicly announce the color of EVERY player.\n\nIf you are exactly right, you win and everyone else loses.',
  'You have no allegiance. Any player that card shares or even color shares with you immediately trades cards with you.\n\nBoth you and the other player assume the powers and the allegiance of the newly acquired cards. At the end of the game, the Hot Potato loses.',
  'You have no allegiance. You win if you are in the same room as the President and Bomber at the end of the game. If you win, the both Red and Blue teams lose.',
  'You have no allegiance. You win if you are able to gain leader status in a majority of the rounds. Hence, you would have to be leader 2 times in a 3 round game.',
  'You have no allegiance. You win if you are sent to a different room as a hostage at the end of MOST rounds. Hence, you would have to be moved 2 times in a 3 round game.',
];

const List INFORMATION_TILES = [
  'Members and Roles',
  'Players in Game',
  'Roles in Game',
  'Your Role',
  'Timer'
];

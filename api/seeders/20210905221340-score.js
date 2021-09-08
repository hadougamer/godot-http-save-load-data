'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    let amount = 5;
    let data   = [];
    let names  = ['Ryu', 'Ken', 'Guile', 'Bison', 'Shun']
    // Faker results
    for ( let i=0; i<amount; i++ ) {
      data.push(
        {
          name: names[i],
          score: 100 - (i*2)
        }
      );
    }

    await queryInterface.bulkInsert('score', data, {} ); 
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete('score', null, {} );
  }
};

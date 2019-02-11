const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
})

function teaAndBiscuits () {
    reader.question('Would you like some tea?', (res) => {

        if (res === 'yes') {
            reader.question('Would you like some biscuits?', (res2) => {
                if(res2 === 'yes'){
                    console.log(`You said ${res} to tea and ${res2} to biscuits`)
                    reader.close()
                }
            })
        }
    })
}

teaAndBiscuits()
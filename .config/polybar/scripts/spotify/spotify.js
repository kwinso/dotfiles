require("dotenv").config();

const axios = require("axios").default;

const token = process.env.SPOTIFY_TOKEN;
const truncLen = parseInt(process.argv[2]) | 60;


(async () => {
    if (token) {
        const { data } = await axios.get(
            "https://api.spotify.com/v1/me/player/currently-playing",
            {
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json",
                    "Authorization": `Bearer ${token}`
                },
            });

        if (data) {
            const byArtist = data.item.artists[0].name;
            const song = data.item.name;

            let label = `${byArtist} - ${song}`;

            if (label.length > truncLen) {
                label = label.substr(0, truncLen);
            }

            return console.log(label);
        }
    }
})();


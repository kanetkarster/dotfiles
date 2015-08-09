#based off https://gist.github.com/wandernauta/6800547 Copyright (C) 2013 Wander Nauta
dbus-send                                                                       \
    --print-reply                                  `# We need the reply.`       \
    --dest="org.mpris.MediaPlayer2.spotify"                                     \
    /org/mpris/MediaPlayer2                                                     \
    org.freedesktop.DBus.Properties.Get                                         \
    string:"$SP_MEMB" string:'Metadata'                                         \
    | grep -Ev "^method"                           `# Ignore the first line.`   \
    | grep -Eo '("(.*)")|(\b[0-9][a-zA-Z0-9.]*\b)' `# Filter interesting fiels.`\
    | sed -E '2~2 a|'                              `# Mark odd fields.`         \
    | tr -d '\n'                                   `# Remove all newlines.`     \
    | sed -E 's/\|/\n/g'                           `# Restore newlines.`        \
    | sed -E 's/(xesam:)|(mpris:)//'               `# Remove ns prefixes.`      \
    | sed -E 's/^"//'                              `# Strip leading...`         \
    | sed -E 's/"$//'                              `# ...and trailing quotes.`  \
    | sed -E 's/"+/|/'                             `# Regard "" as seperator.`  \
    | sed -E 's/ +/ /g'                            `# Merge consecutive spaces.`\
    | grep -E "(title)|(artist)"                   `# get metadata.`            \
    | sed -E 's/(artist|title)\|//'                `# remove tags.`             \
    | tr '\n' '|'                                  `# remove new line.`         \

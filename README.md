#Soprano-CMUSphinx4

This app is base on http://spokentech.net
==================

CMUSphinx4 PoC for Soprano project
### How to install
bundle install --path verndor

### How to run
bundle exec rackup config.ru
Visit http://localhost:9292

## CMUSphinx4 Installation
### Required Software
1. Java SE 6 Development Kit or better
2. Ant 1.6.0 (brew install https://raw.github.com/adamv/homebrew-alt/master/duplicates/ant.rb)
3. Download Sphinx-4 source code (http://sourceforge.net/projects/cmusphinx/files/sphinx4/1.0%20beta6/sphinx4-1.0beta6-src.zip/download)
4. Download Sphinx-4 Hub4 acoustic (http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/US%20English%20HUB4%20Acoustic%20Model/)
5. Download Sphinx-4 Hub4 language model (http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/US%20English%20HUB4%20Language%20Model/) 
6. Download Sphinx-4 dictionary

### Install Step
1. Follow this link to install JSAPI (http://cmusphinx.sourceforge.net/sphinx4/doc/jsapi_setup.html)
2. Extract hub4opensrc.cd_continuous_8gau.zip(Hub4 acoustic) and Copy the extracted folder to $SPHINX_INSTALL_DIRECTORY/models/acustic/ directory 
3. Extract HUB4_trigram_lm.zip(language model) and copy language_model.arpaformat.DMP to $SPHINX_INSTALL_DIRECTORY/models/language/ directory.
4. Create folder $SPHINX_INSTALL_DIRECTORY/models/dictionary/ and copy cmudict.0.7a_SPHINX_40 to this folder
5. Download config.xml from current repo and copy to $SPHINX_INSTALL_DIRECTORY/src/apps/edu/cmu/sphinx/demo/transcriber/config.xml
6. Download Transcriber.java from current repo and copy to src/apps/edu/cmu/sphinx/demo/transcriber/Transcriber.java (override)
7. From $SPHINX_INSTALL_DIRECTORY directory running "ant" in shell

### Test
From $SPHINX_INSTALL_DIRECTORY directory run below command, the text will be populated to the shell
java -mx800m -jar bin/Transcriber.jar file.wav



DESTINATION="dist"

TAG=7.0.63
TOMCAT_URL=http://archive.apache.org/dist/tomcat/tomcat-7/v${TAG}/bin/apache-tomcat-${TAG}-windows-x64.zip
TOMCAT_ZIP=apache-tomcat-${TAG}-windows-x64.zip
TOMCAT_SOURCE=apache-tomcat-${TAG}
TOMCAT_DESTINATION=${TOMCAT_SOURCE}-windows-x64-rehei

JRE_URL=http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jre-8u51-windows-x64.tar.gz
JRE_TARBALL=jre-8u51-windows-x64.tar.gz
JRE_SOURCE=jre1.8.0_51
JRE_DESTINATION=jre

rm -rf $DESTINATION
mkdir $DESTINATION
mkdir $DESTINATION/tmp
cd $DESTINATION/tmp
wget $TOMCAT_URL
unzip $TOMCAT_ZIP
wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" $JRE_URL
tar -zxvf $JRE_TARBALL
cd ..
chmod +x ./tmp/$TOMCAT_SOURCE/bin/*
mv ./tmp/$TOMCAT_SOURCE ./$TOMCAT_DESTINATION
mv ./tmp/$JRE_SOURCE ./$TOMCAT_DESTINATION/$JRE_DESTINATION
rm -rf ./$TOMCAT_DESTINATION/webapps/*
cd ..
cp run.bat dist/$TOMCAT_DESTINATION/.
cp service.bat dist/$TOMCAT_DESTINATION/.
cp service_install_and_start.bat dist/$TOMCAT_DESTINATION/.
cp service_setenv.bat dist/$TOMCAT_DESTINATION/.
cp service_uninstall.bat dist/$TOMCAT_DESTINATION/.
cp catalina.properties dist/$TOMCAT_DESTINATION/conf/.
cp context.xml dist/$TOMCAT_DESTINATION/conf/.
cd dist/$TOMCAT_DESTINATION
zip -r ../${TOMCAT_DESTINATION}.zip .
cd ..
cd ..
rm -rf $DESTINATION/tmp

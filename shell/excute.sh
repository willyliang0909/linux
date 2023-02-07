#execute java with enviroment var & input var, using the path of this file as root path

PRGDIR=`dirname "$0"`

#set APM_REPORT_HOME
APM_REPORT_HOME=`cd "$PRGDIR/.." >/dev/null; pwd`
export APM_REPORT_HOME

CLASSPATH="$APM_REPORT_HOME/bin":"$APM_REPORT_HOME/lib/*"

java \
-classpath "$CLASSPATH" \
com.ad.ADSync "$@"

FROM java:8

MAINTAINER oabogatenko@gmail.com

ENV YOUTRACK_VERSION 2017.3.35488
RUN wget http://download.jetbrains.com/charisma/youtrack-$YOUTRACK_VERSION.jar -O youtrack.jar

EXPOSE 8112

CMD \
    java \
    -Xmx1g \
    -Dorg.tanukisoftware.wrapper.WrapperSimpleApp.waitForStartMain=true \
    -Dorg.tanukisoftware.wrapper.WrapperSimpleApp.maxStartMainWait=300 \
    -XX:MaxPermSize=128m \
    -XX:+HeapDumpOnOutOfMemoryError \
    -XX:+UseConcMarkSweepGC \
    -XX:+DisableExplicitGC \
    -XX:SoftRefLRUPolicyMSPerMB=10000 \
    -XX:+UseBiasedLocking \
    -Djava.awt.headless=true \
    -Xss4m \
    -Dcatalina.base=/home/youtrack/standalone \
    -Djetbrains.dnq.cachePercent=25 \
    -Djetbrains.dnq.sharedCache=false \
    -Djetbains.webr.uiQueryCancellingPolicyTimeout=80000 \
    -Djetbrains.dnq.fairLatches=false \
    -Djetbrains.dnq.readUncommittedForCachingThread=true \
    -Djetbrains.youtrack.disableBrowser=true \
    -jar youtrack.jar 8112

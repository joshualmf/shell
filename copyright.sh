#!/bin/bash

fileName=$1

commentEndLine=0
contentBeginLine=`sed -n '/^[^/]\{2\}/=' ${fileName} | head -n 1`
if [ $contentBeginLine -gt 1 ] ; then
	commentEndLine=$((${contentBeginLine} - 1))
	echo "注释开始从1 到 ${commentEndLine}"
fi

# 如果上一行是 /*
sed -n ''${commentEndLine}'p' ${fileName} | grep '^[ ]*/\*' > /dev/null
if [ $? -eq 0 ] ; then
	commentEndLine=$((${commentEndLine} - 1))
	echo "注释开始从1 到${commentEndLine}"
fi

if [ $commentEndLine -gt 0 ] ; then
	sed -i "tmpbak" '1,'${commentEndLine}'d' ${fileName}
fi

sed -i "tmpbak" '1 i\
//-------------------------------------------------------------------------------------\
// Apple Inc Confidential\
//\
// Copyright (C) 2016 Apple Inc Co., Ltd. All rights reserved.\
//\
// No part of this file may be reproduced or transmitted in any form or by any means, \
// electronic, mechanical, photocopying, recording, or otherwise, without prior  \
// written permission of Apple Inc Co., Ltd.\
//\
//-------------------------------------------------------------------------------------\
\
' ${fileName}

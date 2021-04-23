Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425E5C433ED
	for <dmaengine@archiver.kernel.org>; Fri, 23 Apr 2021 11:50:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B0BD613CB
	for <dmaengine@archiver.kernel.org>; Fri, 23 Apr 2021 11:50:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhDWLul (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 23 Apr 2021 07:50:41 -0400
Received: from mx07-00376f01.pphosted.com ([185.132.180.163]:55440 "EHLO
        mx07-00376f01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229479AbhDWLul (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Fri, 23 Apr 2021 07:50:41 -0400
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
        by mx07-00376f01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 13N7lYc2007463;
        Fri, 23 Apr 2021 12:49:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=dk201812; bh=dvADeKooJoO+b8Rkog6Bwtg0LLK16jbeijciB67SRuQ=;
 b=rSUFpnKYfXxQ7hFpQ6w3LsTgxK1H9KFYfOE+pVu8f2EswMUR4mYz4X2135qLE6ysfgrO
 FfoM3TQ/1aZ7NwV9nVmrT4vMyobhuOwdtBSiyaKdRNjaeSxzrBvnCDATTbV3jz4YTbS1
 tunrfuRZY/ORnxevEmwhgbKw7vFqoZ7SCy9TnU5rm99eLY6vci2VLHyjRWvmGMUKr+kc
 SOB6MnYIeureMV/tzgkTQ9PJNCI2G/C693slPJrXIhR9DYIYWJHitNUG3FPmEu8UBx77
 IluOROA+q0xU6HhldHoXcqJ5TM7teKHYlfceHRdQ9WwTZC9lH0NHq7mAgsHiEmiR37F8 5g== 
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
        by mx07-00376f01.pphosted.com with ESMTP id 383r8kr6ug-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 23 Apr 2021 12:49:49 +0100
Received: from localhost (10.100.70.86) by HHMAIL05.hh.imgtec.org
 (10.100.10.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 23 Apr
 2021 12:49:47 +0100
Date:   Fri, 23 Apr 2021 12:49:47 +0100
From:   Adrian Larumbe <adrian.martinezlarumbe@imgtec.com>
To:     Lars-Peter Clausen <lars@metafoo.de>
CC:     <vkoul@kernel.org>, <dmaengine@vger.kernel.org>,
        <michal.simek@xilinx.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [EXTERNAL] Re: [PATCH 4/4] dmaengine: xilinx_dma: Add device
 synchronisation callback
Message-ID: <20210423114947.v52rrqihpowdjitc@adrianlarumbe-HP-Elite-7500-Series-MT>
References: <20210423011913.13122-1-adrian.martinezlarumbe@imgtec.com>
 <20210423011913.13122-5-adrian.martinezlarumbe@imgtec.com>
 <4f286de6-ab91-ffd1-1119-cd94e5805aa9@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4f286de6-ab91-ffd1-1119-cd94e5805aa9@metafoo.de>
User-Agent: NeoMutt/20171215
X-Originating-IP: [10.100.70.86]
X-ClientProxiedBy: HHMAIL05.hh.imgtec.org (10.100.10.120) To
 HHMAIL05.hh.imgtec.org (10.100.10.120)
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: NrVsUuHYGw-DGGuRK4AUKnJA7oFlrolu
X-Proofpoint-ORIG-GUID: NrVsUuHYGw-DGGuRK4AUKnJA7oFlrolu
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org


On 23.04.2021 08:33, Lars-Peter Clausen wrote:

> Hi,
> 
> 
> Patch looks good, but basically the same got already applied a few weeks ago.

I'll get rid of mine altogether in a later version.

Cheers,
Adrian

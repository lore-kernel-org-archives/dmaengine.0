Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5E6375F81;
	Mon, 28 Sep 2026 03:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564411; cv=fail; b=LNDJ/1ATrOZsqCcH1TkEwryursesiFfVl4hrWVDqujAYl12SL2yhtQ+GhBUw+UKJ9JJqDOoImHUahSguL8Z8qLYcb1NRyKiJp4LFYw2ruQM/2vEfJdEwMhqp4Jg0L7aUfU+6+aV1Q1x6zGg7GLJedxwNeCWkej+IPFx7+9d8l+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564411; c=relaxed/simple;
	bh=Do7nquElUjCNjxHKKJz06ikWEBbk7dhAX7liOkypM60=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t/83BBQvTErrnK+LT05dfYvPKdasrz3f1Qg2RaExkJrYLcabSUplfWz2vaj2U3TqRsgxMMlx2iuXRy4tSmMM04yEzug7AFT+/QuoEnAj0kOpMVXkr08koODRd29/4fPg3cd8dfhY4GVWQ3UyW8FdeD6+oqPz0QxQDQLAh/KOjJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=HST2iMyO; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=f1l3iM6z; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="HST2iMyO";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f1l3iM6z"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RKXrrw2283895;
	Sun, 27 Sep 2026 21:59:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=o5ObAcdStGiVBEZbyTMbr7HN9Rmm0jREHAxzzpZXU
	AE=; b=HST2iMyO6fG8w9LvFcehrbjrpgOBuTSZkh8uOdXUJUX3JGs0CzYwtpCwm
	lKYsqB8+P9VQKJANJjGdX4Y75RPpTOvIXhFq3hP0ZlYahjj4f/VBaQJgfytq9Egy
	V7jE5hnLxzCnqH/2NWWrkYmIQk2gfWyeeH30N/EwW9czDWWncsZQMI4rfJE0Meju
	DY6IfWRQQEtVipHAJErnDxqkEdi5e1SiRZkjfYhVUF4D+5GzsKHPpgpzeEquHxhk
	1P2zAbajM64M6g3iflAUPF0Dt1rGFYm0TBsP7GvO7dzyENcl6h6zMBAnBeQX61Cj
	9Cx1TBu8tM6XSTb/SGfoYwBrZovwg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012003.outbound.protection.outlook.com [40.107.209.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxw6nug30-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 21:59:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsR9l30HHlJ4K6NQdEVR92a19dBpMKydIxQ4bmem6frDgxyKLeQYXA7IphOqLIkTJmD23/mwBzpWy469TnTsgAL/wHmDf2gsoypWUCHNvKlz5sh7HIhB2JM3zxrfw0SghoqzCnVvN8CK66zgR8TnQozBU8Yckdfkuu7i9sh8SIDokXGEzWFfrInQ3jary1iMiDBD6q6F3QvlYj1nt6cHmmIpZw2scAY33C7R8iG2m57NmdqboXXPoqwyrPv2SnB4V7DIxDO1u3r+e/DcH4tb4Ja6fys8GdL4scR4CxlPNlPQi2ea6phjRN/JH6l3VOU15QzMLZudL3bM4gFZ0/kwog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5ObAcdStGiVBEZbyTMbr7HN9Rmm0jREHAxzzpZXUAE=;
 b=f+6tkZAcKdaUrAU9vLvuO/LGBMFwMZ1cCGATKLDOGrkbZg4etwq4s7ZjP6K44xNdJbF+Ldal8Cr02dJV2+Sj6+NG/N4eFnIsZxTDcQp9jyfMLs4/aU8NjesDsm+nf/jx3C442HeUaiRKRD5H7otzjirKpixB+9PwYwb2Ipgy8sG15XzLQREs052XS4VWwu5levKRCujiX8VY2DY+Pa1SXbMgMu1EEtGxH8LzJ1oiZbfzlUqIz0K4VwwNPvrykLYL1ziLzng0ft4c4KzIZHnDtwnRu/0pyBAp6kQLovX8Gp052d0Z/MaPK0pMAIBDVTn6NMSO9wFRONil6+ORkSlOrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5ObAcdStGiVBEZbyTMbr7HN9Rmm0jREHAxzzpZXUAE=;
 b=f1l3iM6zHKd8zAQfjGSa2Daowf6Qqf6W6H/cJ7i15v/w6zQvnCRwq2T3/fsplB51UPJrZasrx4sov5D/BgbC8v2Oho93i7NJq4kKkQkTmDzE8gDootyWur6dPKU02DOLxUhKKfyI8yG7fpiZkhulI3rwbnup+88I13EcFlELY2o=
Received: from DS1PR04CA0012.namprd04.prod.outlook.com (2603:10b6:8:44f::7) by
 IA1PR10MB6711.namprd10.prod.outlook.com (2603:10b6:208:418::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 02:59:48 +0000
Received: from DS2PEPF000061C4.namprd02.prod.outlook.com
 (2603:10b6:8:44f:cafe::47) by DS1PR04CA0012.outlook.office365.com
 (2603:10b6:8:44f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 02:59:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF000061C4.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 02:59:46 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:59:18 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:59:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 21:59:18 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S2vqqO2256662;
	Sun, 27 Sep 2026 21:59:14 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v10 17/19] dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2
Date: Mon, 28 Sep 2026 08:26:23 +0530
Message-ID: <20260928025749.1055383-18-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928025749.1055383-1-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C4:EE_|IA1PR10MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 93e39810-5b16-4779-df84-08df1d0c8dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|82310400026|1800799024|36860700016|921020|6133799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AS8WmCiFIBTCO6X8IBDK7zMoyr+6+cz9iHn2Oxa9lBfBjJaWlRjlG4WidJdTnVjVdlu/K1ENuyZC0jGm2t9AH139tnXqqKB7uLumBDPbEm3y7oAahR7vtXodw1TF9YgYq2H1DAh8EvgPQuBGfo1l5hZFDrJWKqFTh8PJEVZLn+x+NPU3l1B/FfPguiiBiky6HMhoRfJxVDFYYs15TWl75if7xFjKcnXr2p9AoeNQThx15NlA5YZCaQoa/QmvmBsJ9ZFMypY2cVP8H6hcsGLLlgpqEXEzXSJYQyGIerCKA3+CMEbf4z2sBiSKQYTx5iHFcT9XPX2+f840BROzdMcLdeLkclKxmSQmoY+9YhxeKq9Dm2dgmpNp5Opfg3946xlQ5A/cJFohePM8kPNg6r9REVgilavbugSegYbYNCfJG88QtSfuC670tDBxEqN6I79oQvZMKMLdeUlLoN9xxk5yzZskObTwlXYXCrDfQzhUi4rti5HoeIbI9MzWjDSlHNatgC1i9NrizG0Fq1vDIuh7fTWyI+2EIKF/+qm2GsUobM5oSwLDlwp5/IzLS/tVAO0/YC/ISiBU7wOR9BJPVD9ZIvRBXZ5OAX5HtM08XcJ4vR/2ZRZhZ00DwIEs8eRIATqydDuN/nhGD5x2msmsXTtnvkbcRTruqDWbcbK9DpXi2+MZ0s4XniWCc25ACKl84tHX58FHLU/kAG5sj0XysDaHMKIJwbvLP5UNDr/ieN/N+7et636i4uGndArQgWuz4X26
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(82310400026)(1800799024)(36860700016)(921020)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4QH69KefIL0Ax4p9DnhM6kJDNEe5pLNmYVWDFdbqu75fi5zWlFccDZZ8uhcVULMbl2QsON/gJOzR9R8LDXEK84qvP4cqlD7O53p4f7XC31D705jyu5mXUjZ2lg5EyV82n2Dbs6I9mHzCDHAjsZr0YbgzpK7OA/llLDoOSfJixMJOEaeXjMnbrdxwRZ7qAI/632xEBWSukx0kBCS2fx1eQPr4yvhZyo8xKvS0iI0IrkJbz8eeqFBrLJScJFQuZkt/CK0OFpAv0kefMCuVWt9U5Zz6pNRj4/90EBE9QBP9x+RCbEzHPOwfDRxuQy5PpHt2QnvOVN4muaxHgHGeIx4+9C0rCR0Ztz3iYKXwGVDW9r/yKHI1fvvgO5/1EPmw/EylxYaeaVPfp1qGvHpbK9XEGCtD4TFBHP2gNXaXlGidPdMXePi/wxo1QSf6BWorIYCU
X-Exchange-RoutingPolicyChecked:
	aj1sYbiqWVkvY99o9wHUshuxhI5ecD2xcoecY7fOeZr7wLTAdPtF0LMYudsJESmSIJqbD75LESkfMIib8m/tCmk2U5rSBtkNBevKQnZhnoKNT6L20F9TRMdbceNNMZa0lKx8VD5TD6OT1yq8x842cPv24t32K1D5zAjZhy9YUambGHjs5GXWJxYtj45bzbEo84NK1lTIzHiSfjsbRMs2cGSJXOteTq14v4+R3gv/+IiVPIzJoK6on+zEwJCU9wGsi2pfdkw0O7p+EDcICFPAc223ul5afpNxk4vEmiRU3zP5bmK5/zk62atA6+TkDVUBAE09iizCSfPqZ0eSIwKdQg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 02:59:46.3923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e39810-5b16-4779-df84-08df1d0c8dbe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6711
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX6IRZsmacqTd8
 Gg1rilx3ogBrfFQbDOJ9KgcS58ZNWQ55ZSxNQiNuhlmK2PzFcr5CFVwzl0qHISPylkwpixDISdy
 EC2rbOLQHuZEYjYy+SZTtZCX8GNN6JQ=
X-Authority-Analysis: v=2.4 cv=dbkVTnXe c=1 sm=1 tr=0 ts=6ab9d829 cx=c_pps
 a=9H9ADJ10uJ0pYmVeXPB43g==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=s8P6Qq-zSQWvIvMPkfEA:9
X-Proofpoint-ORIG-GUID: D58o6zC2iecsZkxMiJeJmyFkSqYkaEWh
X-Proofpoint-GUID: D58o6zC2iecsZkxMiJeJmyFkSqYkaEWh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX7QZer9UAxNy0
 Ai7p9XPPpWtqI/nS18Ps5/tyEt4BtmPlgNJYf22U9QhHom82+8zhTEuxGXIT5XgYu2FGGT89eim
 wJ49/IN1cR44IGNn0ee5x+AtGDBfHeSeeYDTkPiwYUnannvJkeWjJJJDwxy4HYXy2+pHCtzGwYJ
 lAHEXV1adN7qzxEBRxWXIhO0f1oC64PqP+DV37/rRpqOrPCXh3w1e7MEv1RN8W8WwUAJBB7uwTj
 sOwJEW5+QW98sV1n/jVxJgKlvTAQmoBpSHZi2Tvh+MXqtByjQIRABpYkRXz3HnmNTH7Aj25ybXo
 tCoHBLaEAZAJNDiVXHwhJnLGoNio3izZXcdH1XQJgMsL7aUSq/qSFPsaGZE3/o1Y51bK6QHxMgr
 oMSfe6axtRDKUQ4nGJSkb8MmDxGX0P7IUUkW3FKJTrCGYICIITzV/5AfP2GrurNk4s/CPOoq89G
 CtMLPpx/7LcekTSn6HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280011

The PKTDMA V2 is different than the existing PKTDMA supported by the
k3-udma driver.

The changes in PKTDMA V2 are:
- Autopair: There is no longer a need for PSIL pair and AUTOPAIR bit
  needs to set in the RT_CTL register.
- Static channel mapping: Each channel is mapped to a single
  peripheral.
- Direct IRQs: There is no INT-A and interrupt lines from DMA are
  directly connected to GIC.
- Remote side configuration handled by DMA. So no need to write to
  PEER registers to START / STOP / PAUSE / TEARDOWN.
- Unified Channel Space: Tx and Rx channels share a single register
  space. Each channel index is specifically fixed in hardware as either
  Tx or Rx in an interleaved manner.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c  |  35 +++--
 drivers/dma/ti/k3-udma-glue.c    |  23 ++++
 drivers/dma/ti/k3-udma-private.c |  22 ++-
 drivers/dma/ti/k3-udma-v2.c      | 222 +++++++++++++++++++++++++++++--
 drivers/dma/ti/k3-udma.h         |   3 +
 5 files changed, 278 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 30cb8044ff100..5fa3a7b8d2026 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2465,9 +2465,16 @@ static int pktdma_setup_resources(struct udma_dev *ud)
 	ud->tchan_map = devm_bitmap_zalloc(dev, ud->tchan_cnt, GFP_KERNEL);
 	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
 				  GFP_KERNEL);
-	ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
-	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
-				  GFP_KERNEL);
+	if (ud->match_data->version == K3_UDMA_V1) {
+		ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
+		ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
+					  GFP_KERNEL);
+	} else {
+		ud->rchan_map = ud->tchan_map;
+		ud->rchans = ud->tchans;
+		ud->chan_map = ud->tchan_map;
+		ud->chans = ud->tchans;
+	}
 	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
 					sizeof(unsigned long),
 					GFP_KERNEL);
@@ -2566,13 +2573,21 @@ int k3_udma_setup_resources(struct udma_dev *ud)
 		}
 		break;
 	case DMA_TYPE_PKTDMA:
-		dev_info(dev,
-			 "Channels: %d (tchan: %u, rchan: %u)\n",
-			 ch_count,
-			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
-						       ud->tchan_cnt),
-			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
-						       ud->rchan_cnt));
+		if (ud->match_data->version == K3_UDMA_V1) {
+			dev_info(dev,
+				 "Channels: %d (tchan: %u, rchan: %u)\n",
+				 ch_count,
+				 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
+							       ud->tchan_cnt),
+				 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
+							       ud->rchan_cnt));
+		} else {
+			dev_info(dev,
+				 "Channels: %d (tchan + rchan: %u)\n",
+				 ch_count,
+				 ud->chan_cnt - bitmap_weight(ud->chan_map,
+							      ud->chan_cnt));
+		}
 		break;
 	default:
 		break;
diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
index 70eaf7ee57e68..996c130b10f4a 100644
--- a/drivers/dma/ti/k3-udma-glue.c
+++ b/drivers/dma/ti/k3-udma-glue.c
@@ -166,6 +166,29 @@ static int of_k3_udma_glue_parse_chn(struct device_node *chn_np,
 		goto out_put_spec;
 
 	thread_id = dma_spec.args[0];
+
+	/*
+	 * V2 PKTDMA DT specifiers encode the hardware flow/channel ID in
+	 * args[0] rather than the PSI-L thread ID used by V1. Resolve the
+	 * PSI-L thread ID before the common path checks the direction bit.
+	 */
+	if (common->udmax->match_data->version == K3_UDMA_V2 &&
+	    xudma_is_pktdma(common->udmax)) {
+		struct psil_endpoint_config *ep_cfg;
+		u32 psil_thread_id;
+		bool dev_to_mem;
+
+		ep_cfg = psil_get_ep_config_by_id(thread_id, true,
+						  &psil_thread_id, &dev_to_mem);
+		if (IS_ERR(ep_cfg)) {
+			dev_err(common->dev,
+				"No PSI-L config for flow %u\n", thread_id);
+			ret = PTR_ERR(ep_cfg);
+			goto out_put_spec;
+		}
+		thread_id = psil_thread_id;
+	}
+
 	if (dma_spec.args_count == 2) {
 		if (dma_spec.args[1] > 2 && !xudma_is_pktdma(common->udmax)) {
 			dev_err(common->dev, "Invalid channel atype: %u\n",
diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
index 44c097fff5ee6..525155d3bb513 100644
--- a/drivers/dma/ti/k3-udma-private.c
+++ b/drivers/dma/ti/k3-udma-private.c
@@ -174,16 +174,30 @@ EXPORT_SYMBOL(xudma_is_pktdma);
 
 int xudma_pktdma_tflow_get_irq(struct udma_dev *ud, int udma_tflow_id)
 {
-	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+	if (ud->match_data->version == K3_UDMA_V1) {
+		const struct udma_oes_offsets *oes = &ud->soc_data->oes;
 
-	return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
+		return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
+	}
+	struct platform_device *pdev = to_platform_device(ud->dev);
+	char irq_name[10];
+
+	snprintf(irq_name, sizeof(irq_name), "tx-%u", udma_tflow_id);
+	return platform_get_irq_byname(pdev, irq_name);
 }
 EXPORT_SYMBOL(xudma_pktdma_tflow_get_irq);
 
 int xudma_pktdma_rflow_get_irq(struct udma_dev *ud, int udma_rflow_id)
 {
-	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+	if (ud->match_data->version == K3_UDMA_V1) {
+		const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+
+		return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);
+	}
+	struct platform_device *pdev = to_platform_device(ud->dev);
+	char irq_name[10];
 
-	return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);
+	snprintf(irq_name, sizeof(irq_name), "rx-%u", udma_rflow_id);
+	return platform_get_irq_byname(pdev, irq_name);
 }
 EXPORT_SYMBOL(xudma_pktdma_rflow_get_irq);
diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
index ba3042e866cac..a71471aa7707a 100644
--- a/drivers/dma/ti/k3-udma-v2.c
+++ b/drivers/dma/ti/k3-udma-v2.c
@@ -578,7 +578,7 @@ static int udma_v2_alloc_rx_resources(struct udma_chan *uc)
 
 	rflow = uc->rflow;
 	if (ud->tflow_cnt)
-		fd_ring_id = ud->tflow_cnt + rflow->id;
+		fd_ring_id = rflow->id;
 	else
 		fd_ring_id = uc->rchan->id;
 	ret = k3_ringacc_request_rings_pair(ud->ringacc, fd_ring_id, -1,
@@ -770,6 +770,148 @@ static int bcdma_v2_alloc_chan_resources(struct dma_chan *chan)
 	return ret;
 }
 
+static int pktdma_v2_alloc_chan_resources(struct dma_chan *chan)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	struct udma_dev *ud = to_udma_dev(chan->device);
+	struct platform_device *pdev = to_platform_device(ud->dev);
+	char irq_name[10];
+	u32 irq_ring_idx;
+	int ret;
+
+	/*
+	 * Make sure that the completion is in a known state:
+	 * No teardown, the channel is idle
+	 */
+	reinit_completion(&uc->teardown_completed);
+	complete_all(&uc->teardown_completed);
+	uc->state = UDMA_CHAN_IS_IDLE;
+
+	switch (uc->config.dir) {
+	case DMA_MEM_TO_DEV:
+		/* Slave transfer synchronized - mem to dev (TX) transfer */
+		dev_dbg(uc->ud->dev, "%s: chan%d as MEM-to-DEV\n", __func__,
+			uc->id);
+
+		ret = udma_v2_alloc_tx_resources(uc);
+		if (ret) {
+			uc->config.remote_thread_id = -1;
+			return ret;
+		}
+
+		uc->config.src_thread = ud->psil_base + uc->tchan->id;
+		uc->config.dst_thread = uc->config.remote_thread_id;
+		uc->config.dst_thread |= K3_PSIL_DST_THREAD_ID_OFFSET;
+
+		irq_ring_idx = uc->config.mapped_channel_id;
+		break;
+	case DMA_DEV_TO_MEM:
+		/* Slave transfer synchronized - dev to mem (RX) transfer */
+		dev_dbg(uc->ud->dev, "%s: chan%d as DEV-to-MEM\n", __func__,
+			uc->id);
+
+		ret = udma_v2_alloc_rx_resources(uc);
+		if (ret) {
+			uc->config.remote_thread_id = -1;
+			return ret;
+		}
+
+		uc->config.src_thread = uc->config.remote_thread_id;
+		uc->config.dst_thread = (ud->psil_base + uc->rchan->id) |
+					K3_PSIL_DST_THREAD_ID_OFFSET;
+
+		irq_ring_idx = uc->config.mapped_channel_id;
+		udma_write(uc->rflow->reg_rt, UDMA_RX_FLOWRT_RFA, BIT(28));
+		break;
+	default:
+		/* Can not happen */
+		dev_err(uc->ud->dev, "%s: chan%d invalid direction (%u)\n",
+			__func__, uc->id, uc->config.dir);
+		return -EINVAL;
+	}
+
+	/* check if the channel configuration was successful */
+	if (ret)
+		goto err_res_free;
+
+	if (udma_is_chan_running(uc)) {
+		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
+		ud->reset_chan(uc, false);
+		if (udma_is_chan_running(uc)) {
+			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
+			ret = -EBUSY;
+			goto err_res_free;
+		}
+	}
+
+	uc->dma_dev = dmaengine_get_dma_device(chan);
+	uc->hdesc_pool = dma_pool_create(uc->name, uc->dma_dev,
+					 uc->config.hdesc_size, ud->desc_align,
+					 0);
+	if (!uc->hdesc_pool) {
+		dev_err(ud->ddev.dev,
+			"Descriptor pool allocation failed\n");
+		uc->use_dma_pool = false;
+		ret = -ENOMEM;
+		goto err_res_free;
+	}
+
+	uc->use_dma_pool = true;
+
+	uc->psil_paired = true;
+
+	INIT_DELAYED_WORK(&uc->tx_drain.work, udma_check_tx_completion);
+
+	if (uc->config.dir == DMA_MEM_TO_DEV)
+		snprintf(irq_name, sizeof(irq_name), "tx-%u", irq_ring_idx);
+	else
+		snprintf(irq_name, sizeof(irq_name), "rx-%u", irq_ring_idx);
+	uc->irq_num_ring = platform_get_irq_byname(pdev, irq_name);
+	if (uc->irq_num_ring < 0) {
+		ret = uc->irq_num_ring;
+		goto err_res_free;
+	}
+
+	ret = request_irq(uc->irq_num_ring, udma_v2_ring_irq_handler,
+			  IRQF_SHARED | IRQF_TRIGGER_HIGH, uc->name, uc);
+
+	if (ret) {
+		dev_err(ud->dev, "chan%d: ring irq request failed\n", uc->id);
+		goto err_irq_free;
+	}
+
+	uc->irq_num_udma = 0;
+
+	udma_reset_rings(uc);
+
+	if (uc->tchan)
+		dev_dbg(ud->dev,
+			"chan%d: tchan%d, tflow%d, Remote thread: 0x%04x\n",
+			uc->id, uc->tchan->id, uc->tchan->tflow_id,
+			uc->config.remote_thread_id);
+	else if (uc->rchan)
+		dev_dbg(ud->dev,
+			"chan%d: rchan%d, rflow%d, Remote thread: 0x%04x\n",
+			uc->id, uc->rchan->id, uc->rflow->id,
+			uc->config.remote_thread_id);
+	return 0;
+
+err_irq_free:
+	uc->irq_num_ring = 0;
+err_res_free:
+	udma_free_tx_resources(uc);
+	udma_free_rx_resources(uc);
+
+	udma_reset_uchan(uc);
+
+	if (uc->use_dma_pool) {
+		dma_pool_destroy(uc->hdesc_pool);
+		uc->use_dma_pool = false;
+	}
+
+	return ret;
+}
+
 static enum dma_status udma_v2_tx_status(struct dma_chan *chan,
 					 dma_cookie_t cookie,
 					 struct dma_tx_state *txstate)
@@ -1032,11 +1174,34 @@ static struct udma_match_data bcdma_v2_am62l_data = {
 	.rchan_cnt = 128,
 };
 
+static struct udma_match_data pktdma_v2_am62l_data = {
+	.type = DMA_TYPE_PKTDMA,
+	.version = K3_UDMA_V2,
+	.psil_base = 0x1000,
+	.enable_memcpy_support = false, /* PKTDMA does not support MEM_TO_MEM */
+	.flags = UDMA_FLAGS_J7_CLASS,
+	.statictr_z_mask = GENMASK(23, 0),
+	.burst_size = {
+		TI_SCI_RM_UDMAP_CHAN_BURST_SIZE_64_BYTES, /* Normal Channels */
+		0, /* No H Channels */
+		0, /* No UH Channels */
+	},
+	.tchan_cnt = 97,
+	.rchan_cnt = 97,
+	.chan_cnt = 97,
+	.tflow_cnt = 112,
+	.rflow_cnt = 112,
+};
+
 static const struct of_device_id udma_of_match[] = {
 	{
 		.compatible = "ti,am62l-dmss-bcdma",
 		.data = &bcdma_v2_am62l_data,
 	},
+	{
+		.compatible = "ti,am62l-dmss-pktdma",
+		.data = &pktdma_v2_am62l_data,
+	},
 	{ /* Sentinel */ },
 };
 
@@ -1055,15 +1220,23 @@ static int udma_v2_get_mmrs(struct platform_device *pdev, struct udma_dev *ud)
 	if (IS_ERR(ud->mmrs[V2_MMR_GCFG]))
 		return PTR_ERR(ud->mmrs[V2_MMR_GCFG]);
 
-	ud->bchan_cnt = ud->match_data->bchan_cnt;
-	/* There are no tchan and rchan in BCDMA_V2.
+	/* There are no tchan and rchan in BCDMA_V2 and PKTDMA_V2.
 	 * Duplicate chan as tchan and rchan to keep the common code
-	 * in k3-udma-common.c functional for BCDMA_V2.
+	 * in k3-udma-common.c functional.
 	 */
-	ud->chan_cnt = ud->match_data->chan_cnt;
-	ud->tchan_cnt = ud->match_data->chan_cnt;
-	ud->rchan_cnt = ud->match_data->chan_cnt;
-	ud->rflow_cnt = ud->chan_cnt;
+	if (ud->match_data->type == DMA_TYPE_BCDMA) {
+		ud->bchan_cnt = ud->match_data->bchan_cnt;
+		ud->chan_cnt = ud->match_data->chan_cnt;
+		ud->tchan_cnt = ud->match_data->chan_cnt;
+		ud->rchan_cnt = ud->match_data->chan_cnt;
+		ud->rflow_cnt = ud->chan_cnt;
+	} else if (ud->match_data->type == DMA_TYPE_PKTDMA) {
+		ud->chan_cnt = ud->match_data->chan_cnt;
+		ud->tchan_cnt = ud->match_data->tchan_cnt;
+		ud->rchan_cnt = ud->match_data->rchan_cnt;
+		ud->tflow_cnt = ud->match_data->tflow_cnt;
+		ud->rflow_cnt = ud->match_data->rflow_cnt;
+	}
 
 	for (i = 1; i < V2_MMR_LAST; i++) {
 		if (i == V2_MMR_BCHANRT && ud->bchan_cnt == 0)
@@ -1117,6 +1290,7 @@ static int udma_v2_probe(struct platform_device *pdev)
 	ud->reset_chan = udma_v2_reset_chan;
 	ud->decrement_byte_counters = udma_v2_decrement_byte_counters;
 	ud->bcdma_setup_sci_resources = NULL;
+	ud->pktdma_setup_sci_resources = NULL;
 
 	ret = udma_v2_get_mmrs(pdev, ud);
 	if (ret)
@@ -1124,7 +1298,17 @@ static int udma_v2_probe(struct platform_device *pdev)
 
 	struct k3_ringacc_init_data ring_init_data = {0};
 
-	ring_init_data.num_rings = ud->bchan_cnt + ud->chan_cnt;
+	if (ud->match_data->type == DMA_TYPE_BCDMA) {
+		ring_init_data.num_rings = ud->bchan_cnt + ud->chan_cnt;
+	} else if (ud->match_data->type == DMA_TYPE_PKTDMA) {
+		ring_init_data.num_rings = ud->rflow_cnt;
+
+		ud->rflow_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
+		if (IS_ERR(ud->rflow_rt))
+			return PTR_ERR(ud->rflow_rt);
+
+		ring_init_data.base_rt = ud->rflow_rt;
+	}
 
 	ud->ringacc = k3_ringacc_dmarings_init(pdev, &ring_init_data);
 
@@ -1133,8 +1317,10 @@ static int udma_v2_probe(struct platform_device *pdev)
 
 	dma_cap_set(DMA_SLAVE, ud->ddev.cap_mask);
 
-	dma_cap_set(DMA_CYCLIC, ud->ddev.cap_mask);
-	ud->ddev.device_prep_dma_cyclic = udma_prep_dma_cyclic;
+	if (ud->match_data->type != DMA_TYPE_PKTDMA) {
+		dma_cap_set(DMA_CYCLIC, ud->ddev.cap_mask);
+		ud->ddev.device_prep_dma_cyclic = udma_prep_dma_cyclic;
+	}
 
 	ud->ddev.device_config = udma_slave_config;
 	ud->ddev.device_prep_slave_sg = udma_prep_slave_sg;
@@ -1148,8 +1334,18 @@ static int udma_v2_probe(struct platform_device *pdev)
 	ud->ddev.dbg_summary_show = udma_dbg_summary_show;
 #endif
 
-	ud->ddev.device_alloc_chan_resources =
-		bcdma_v2_alloc_chan_resources;
+	switch (ud->match_data->type) {
+	case DMA_TYPE_BCDMA:
+		ud->ddev.device_alloc_chan_resources =
+			bcdma_v2_alloc_chan_resources;
+		break;
+	case DMA_TYPE_PKTDMA:
+		ud->ddev.device_alloc_chan_resources =
+			pktdma_v2_alloc_chan_resources;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	ud->ddev.device_free_chan_resources = udma_free_chan_resources;
 
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index b2e5455b1087e..2a9686f7a09bc 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -27,8 +27,11 @@
 #define UDMA_RX_FLOW_ID_FW_OES_REG	0x80
 #define UDMA_RX_FLOW_ID_FW_STATUS_REG	0x88
 
+#define UDMA_RX_FLOWRT_RFA             0x8
+
 /* BCHANRT/TCHANRT/RCHANRT registers */
 #define UDMA_CHAN_RT_CTL_REG		0x0
+#define UDMA_CHAN_RT_CFG_REG		0x4
 #define UDMA_CHAN_RT_SWTRIG_REG		0x8
 #define UDMA_CHAN_RT_STDATA_REG		0x80
 
-- 
2.54.0


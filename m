Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDD14CDDCD;
	Thu,  1 Oct 2026 08:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844206; cv=fail; b=JRZN3Y6Ljg2ltne2o6KGo5UXBcfsiF7NUMGb7fDZvvT5/9lSP9dM86BpqnuGL3Klqepq43idP4mbW3Uspxui9EcNH+TuYFL8sZZXGmq0ngMaPi8va0OpSsoTfE1rlnfMD1MnlYxtyvoQpCQKSUbGSwI2/2b5vwQh4QhNvxn4QuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844206; c=relaxed/simple;
	bh=ckOhsv0AHAu30OPIEFVTfZFPwC3BxcG5wFngw2pA3do=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=drqmAc7n0ipzIbICRJO1mzF0bYpMyfIFaOHR7yxV8nmqt4szru0ez7dWgGWAYWz87tlNjxh4/o2/DtNurcASkIv5yFn2NYjLc3wR8UsDdurmdZ/NGjbPnH/QF2id4zjpl8PaNxEupv0mDk4WPORdc86OW9arGq4D2ZCdK9D3cXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=dN8+cpEv; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=JVsFuuMA; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="dN8+cpEv";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="JVsFuuMA"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69171FBg793621;
	Thu, 1 Oct 2026 03:43:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5C2cJxeUuvGHAKOwCDWyn6OY38sRbppnxLMxJBCAk
	ig=; b=dN8+cpEvBkhz4y6oc/uqQ4wojDOTajFU0W24FLcW5o/FQYZdPu+D/XpBU
	8i/Ac5wthksr2ix93kUBnN6QegkFrxq7PRolBFooyKmsv6zy4CasFYgcGKQhKDWf
	Ubbt02LyhImXRIbagxp8SKKtgR1vfDLjVvZEjhCSRXlLyYsG1NisAcLPDBq+OJfm
	f/qAVaAKc5fRJz9BzE0mLy32sIV/+e39FDZfydjmOlxI+nXyfZwLJf2nDwMyhMP0
	00LPuisNMoIwYCdCkp40YyeNyKR0PGjpjYPTsLWy6ClcG/1I6qKgPDbobZ8BT3mY
	4EkLwoiV5bp0noZO2IfCqF9j7IJQQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013047.outbound.protection.outlook.com [40.107.201.47])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h17djv3fj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:43:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VoU50kvQZmgR9xULDY5k669aIuLZ/cqqdrD2et+u+oK0SwNUXRkG/li5edPHZ5dPcb4Bpxw/TVDMI/+7Na0UUAldV8EneUgR8CHKKjfcbwjKBX1XZcJG4x8vhn2E27ykQjYD9dIlZ6S8sxJKLu4GSwuYk/SEinRQ/Siy8MBgo7Qc9GZnJknBUXtvfJFdgc2zpeSutgxLYitZqgI854Nao0kE7oPYj1uyYpcKhWha4PsMrm2j7aBpzipELfYF1G6D9JZLIxuI4hNwhvjl/2AK7yy8T7bIMlwVgkwwdfunqGKN9/nE1LqR7dOkVOLlpUWL0E/xheMIv0h18rgGLnayoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5C2cJxeUuvGHAKOwCDWyn6OY38sRbppnxLMxJBCAkig=;
 b=Qp28jOSP4kZ3u+Ov/c+WlojzDHz5u9IC4XV/RTC6RHxapRsgj2KZr9lc7v1/Q0Cm7/JI3PXG25W0NV+MEW8WaKPASdteWIZRcpv1FqDjwthVZjmVecDg/w3wqmWyEZlQhKLad10ZovbW+uvlsQCrzDvy/5oQrNNWkppByVf+vQzpiUAqjsHEAei59Yn6vbLJH9UV06vvkmg1oxUG9FO7MneXNSGMdEl2qQpSRKh/qUZTARA0/ekiNDh73qmBstjWc1mbxj0stHB3WpshRTXjbYVUYwXZoOoBTHNOS2Ozqon7Of/RfoJsAc2XBugwlUVqZnTA67r3NVCX/qSIZYXkvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5C2cJxeUuvGHAKOwCDWyn6OY38sRbppnxLMxJBCAkig=;
 b=JVsFuuMAW9DRa9faYkPaKfdr25cPFOr8+nc6SaVHHYUnqIKaqC722PY99shaytg5P06HCjqqmfGsoXjnmMCq1LxWHwAmszKkya8EOeopjd4ojvbgfjlDbsOgBs6UeD01CREqjGxGkT5i6a9sOuYkXWM7h0KcJ/Y4EvoBbTdX7ww=
Received: from CH2PR12CA0022.namprd12.prod.outlook.com (2603:10b6:610:57::32)
 by DS6PR10MB997875.namprd10.prod.outlook.com (2603:10b6:8:464::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 1 Oct
 2026 08:43:07 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::ab) by CH2PR12CA0022.outlook.office365.com
 (2603:10b6:610:57::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 08:43:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 08:43:06 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:33 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:42:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:42:32 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9s8630551;
	Thu, 1 Oct 2026 03:42:28 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 17/19] dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2
Date: Thu, 1 Oct 2026 14:10:33 +0530
Message-ID: <20261001084105.1692228-18-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001084105.1692228-1-s-adivi@ti.com>
References: <20261001084105.1692228-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|DS6PR10MB997875:EE_
X-MS-Office365-Filtering-Correlation-Id: 016818ab-d0de-435d-b0f3-08df1f9803a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|7416014|1800799024|921020|56012099006|22082099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	tWQwxsmyirTZxL5k4EZ5pCZdfy5xI0ig1FZltueZobMd2YGdGgxzonEb+G/mvYMMOt2/XQb5suN7QdugUFpOxRJUhUdlzGhKLJw/CPzZAo7MvjMpkKXggwSok3IgUSMo+jNsDLpdhuZClMuzY00Gqhum2+yaeYOCtl8+8QWchyjGV/yjENp5yc8Gj6bKJSZh66jteIHGlxQwusgci/GhB7bdPrZOR/EAQIQyP/gxUgAJIUzMmqkkaUP4xk02PlWgfmTYOkrLS9SGZeFUuNVco6VBCKt310O2tIf951ZJ6upkuGFXI0OOqQPWH0jXT1fU82O7I6SvtceJ6aLitvVfat7LkUXARHksONOmdr8zPI/IcaDr7ZTsCEZianKSID1RLER1afHnFhDG8hhKhYGw+xt0xDB/jv9u7ulaXeN8ehCJzvvEOvtJKgmgnr5PayKJuX/gR6hpolppgEubvWwb1NEOLct++IHQipooKUnYqzn7bzpzUWC8fltRNSVOM7cJJClt6jOSV1tNUv4kxD3vW4bW4w4j5h+p1SX82IA6BGybpKGYv5+Y0Uxx31y2cdq4DN3ZhpmtPv0FSo6nQeHLDJz7kKnIsMlo+7a+cdG1hFwTJ/+urTpeXUOsvVLJnzNHe/C+Y/EcYOKzzpD4sIdMReCAEgtDt/GZ7B5Wbr/ffr5VmPctrFFcnml9v+GJmPXjI+Dh9q5aRApq1hFBVZlOQHgd0dZVrrYGDSNXEiPbtb3ckVcvtgstWDNlZdC77HkP
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(7416014)(1800799024)(921020)(56012099006)(22082099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rOsa1+YeRPICqdCMh1k3EY5GXA3tSjjuLu/6dfdhW6m+QFAYeoFDZgcoC+QLo3HXRdygCJ9jdnZXuISmQ5UwZtPiyVjnO9HOCD3g5PMECmjqxR8ASpYhoYIG72Ib9cPFu7dqpeCO8Lxn5UP6Pa7s734ufvbJGaizP6C9inXOnZ+cilKEr8jwECiA5BzrzXY/8hBsaRcPjqKfK8lTtg8lpkbtBDjUt6cbrKvMiMNdLKmqN1L1i2N6ko+ABBh9G9W7bd2+EhCxeDjVHxdfQCk706v7G/EZbP4VkIDdA74K86Fs81FX4OgEMGSaIZbxA6ddantthNIuO1h9+qCqr7xX9MxA/67KVNDVHxFSUw+G0DAG+scykpIzvg9R4s04wgQbUT1+Z8WoFZU99XMq6Xvx6vXfuu//9DNbEz7KR9tDWY2hoAKJ9Tw6gv9FsWGFrhwv
X-Exchange-RoutingPolicyChecked:
	r3Kzw0c8Lh2x82+EQPDL23uvoyBSnYpm/8aS3yqPRpm47A5mKUd/4JiNv3JN+ufQOLh12ZjG3GlKIbwsduSLLXfreFDIAFhNu6ec1ZwwKwed3TPYQ3g3UhEJxVXc5RRY8e5zLGBBpy6YTIHt3ydisud3mmsd929kFn6YcErGFAi8j9iq4Mz3Q5LgUQEkwfIFaFH4u7cGED0ezEeKLUNite08mrJ6y/ehLJ2J41zzrB567C0ZW32UlOWjPumiV2mzAaKBWcYBub2keQsw7LvX6MXbe/gwmxwlnkvL0yVg1nwcF+lQ6+aipYntklwrlqtxyANZFd5VM/efPw6v30H/Cg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:43:06.5380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 016818ab-d0de-435d-b0f3-08df1f9803a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR10MB997875
X-Proofpoint-GUID: ag9FhuSqu1LWURCnxIA0VbLCDPhD54Lz
X-Authority-Analysis: v=2.4 cv=aswnmiZV c=1 sm=1 tr=0 ts=6abe1d21 cx=c_pps
 a=2P5E0MqkZ2zb1j7CzKDU6Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=yoQLACVbf3K9FHgXu8QA:9
X-Proofpoint-ORIG-GUID: ag9FhuSqu1LWURCnxIA0VbLCDPhD54Lz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX2TwvK59A5Nm7
 LVSUdseLDaERGuxmrtKJ0NLBsrvfHEyJ6pJBBCCcYEMvzWgyjKlmSkefE+cT+b6OUTDKEMt/XGJ
 lRJd2MHIpOWQue2V93bD1JuR3an/HzY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXxRYZG1ak+1GO
 3XO+dMMwdO62ovDAcnat8IRrWdMr1/AeE+5UkcLPcTGxfZ6Y3wXHnfoRI1YdOghsrj7suBFSlr9
 2Tr1xul9r+jZlEEGbpF82EdSuRB+JwvRVZyrIAlebr/WZcCKGCYhScSRbm44LJVRECREIeo89vB
 svTVrI9zE70i8jCHvUKt1AKXA/9S7GovNkUHgY2dgskWPr8zIpbLHynQ+JXMQXmalX9Wi8kxhun
 cs1oom/xZGueegz6zK6F7QmVE+2jH/vP6bVGbHroelAgk06RS1Ka1LZy7sVFOpcu7q7boLwDPc3
 aAlFfyoi3aKS1WkBNmzXEdNEPjosAYaJ7RGQf7l1LzxnkcK1lEXryhLfeuKgzK2bLR1z3S/s4xc
 yR2UBi6oVve1v7xpo2v5SVVyk78ARUBq4Re0Ni47hIID0PC1KhfBdNI7DyeQDZWSm9gGjMvyW0m
 c4J/OTIvzCcHZwIONMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

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
 drivers/dma/ti/k3-udma-glue.c    |  23 +++
 drivers/dma/ti/k3-udma-private.c |  22 ++-
 drivers/dma/ti/k3-udma-v2.c      | 236 +++++++++++++++++++++++++++++--
 drivers/dma/ti/k3-udma.h         |   3 +
 5 files changed, 292 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 53c7a4c12855c..5602ac551d5e2 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2477,9 +2477,16 @@ static int pktdma_setup_resources(struct udma_dev *ud)
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
@@ -2585,13 +2592,21 @@ int k3_udma_setup_resources(struct udma_dev *ud)
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
index f9e2a1e1e0a50..78722a7f8ebd2 100644
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
index d2501e074bcfb..3f6235cd4d72a 100644
--- a/drivers/dma/ti/k3-udma-private.c
+++ b/drivers/dma/ti/k3-udma-private.c
@@ -190,16 +190,30 @@ EXPORT_SYMBOL(xudma_is_pktdma);
 
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
index 8465517e8d21a..3f6f735c5a75e 100644
--- a/drivers/dma/ti/k3-udma-v2.c
+++ b/drivers/dma/ti/k3-udma-v2.c
@@ -609,7 +609,7 @@ static int udma_v2_alloc_rx_resources(struct udma_chan *uc)
 
 	rflow = uc->rflow;
 	if (ud->tflow_cnt)
-		fd_ring_id = ud->tflow_cnt + rflow->id;
+		fd_ring_id = rflow->id;
 	else
 		fd_ring_id = uc->rchan->id;
 	ret = k3_ringacc_request_rings_pair(ud->ringacc, fd_ring_id, -1,
@@ -801,6 +801,155 @@ static int bcdma_v2_alloc_chan_resources(struct dma_chan *chan)
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
+		/*
+		 * Use the tx flow ID here, matching how the TX ring itself
+		 * was addressed in udma_v2_alloc_tx_resources() and how the
+		 * glue layer (xudma_pktdma_tflow_get_irq()) looks up this
+		 * same IRQ, instead of mapped_channel_id.
+		 */
+		irq_ring_idx = uc->tchan->tflow_id;
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
+		/* Use the rx flow ID here, see the DMA_MEM_TO_DEV case above */
+		irq_ring_idx = uc->rflow->id;
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
+	udma_reset_rings(uc);
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
@@ -1063,11 +1212,34 @@ static struct udma_match_data bcdma_v2_am62l_data = {
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
 
@@ -1086,15 +1258,23 @@ static int udma_v2_get_mmrs(struct platform_device *pdev, struct udma_dev *ud)
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
@@ -1148,6 +1328,7 @@ static int udma_v2_probe(struct platform_device *pdev)
 	ud->reset_chan = udma_v2_reset_chan;
 	ud->decrement_byte_counters = udma_v2_decrement_byte_counters;
 	ud->bcdma_setup_sci_resources = NULL;
+	ud->pktdma_setup_sci_resources = NULL;
 
 	ret = udma_v2_get_mmrs(pdev, ud);
 	if (ret)
@@ -1155,7 +1336,24 @@ static int udma_v2_probe(struct platform_device *pdev)
 
 	struct k3_ringacc_init_data ring_init_data = {0};
 
-	ring_init_data.num_rings = ud->bchan_cnt + ud->chan_cnt;
+	if (ud->match_data->type == DMA_TYPE_BCDMA) {
+		ring_init_data.num_rings = ud->bchan_cnt + ud->chan_cnt;
+	} else if (ud->match_data->type == DMA_TYPE_PKTDMA) {
+		/*
+		 * tflow_cnt == rflow_cnt on this hardware and tx/rx flow IDs
+		 * for a given channel coincide, so a single ring array sized
+		 * to rflow_cnt covers both; any extra flow indices beyond a
+		 * channel's own ID are reserved for that channel and not
+		 * reused elsewhere, so there is no collision.
+		 */
+		ring_init_data.num_rings = ud->rflow_cnt;
+
+		ud->rflow_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
+		if (IS_ERR(ud->rflow_rt))
+			return PTR_ERR(ud->rflow_rt);
+
+		ring_init_data.base_rt = ud->rflow_rt;
+	}
 
 	ud->ringacc = k3_ringacc_dmarings_init(pdev, &ring_init_data);
 
@@ -1164,8 +1362,10 @@ static int udma_v2_probe(struct platform_device *pdev)
 
 	dma_cap_set(DMA_SLAVE, ud->ddev.cap_mask);
 
-	dma_cap_set(DMA_CYCLIC, ud->ddev.cap_mask);
-	ud->ddev.device_prep_dma_cyclic = udma_prep_dma_cyclic;
+	if (ud->match_data->type != DMA_TYPE_PKTDMA) {
+		dma_cap_set(DMA_CYCLIC, ud->ddev.cap_mask);
+		ud->ddev.device_prep_dma_cyclic = udma_prep_dma_cyclic;
+	}
 
 	ud->ddev.device_config = udma_slave_config;
 	ud->ddev.device_prep_slave_sg = udma_prep_slave_sg;
@@ -1179,8 +1379,18 @@ static int udma_v2_probe(struct platform_device *pdev)
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
index 2e9d8a6d3ae37..7210dd896add8 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -28,8 +28,11 @@
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
2.55.0


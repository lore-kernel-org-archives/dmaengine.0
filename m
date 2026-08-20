Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020105.outbound.protection.outlook.com [52.101.229.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6807D47F774;
	Thu, 20 Aug 2026 17:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247292; cv=fail; b=YfH/l+RTysTrkluouXXznyqKEdsGvo/iobeHQOpTlZU6ZV+V2DEZZFoJC+u4QEta6Zkuoke+brGi2nwuAyL8BUqHjvEapOIS8MJA+THhP+Dfw66v8BghvF58mz0yPZPvh38ktCoOziHxHGONg2O3hfwaxc34W2lDXc4uJLTnydg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247292; c=relaxed/simple;
	bh=s6yjTSqKiqcRJYKGTSdPfrmdsZv/EnTyRj8t/71BYfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nmLXcw6nHJ5Pm1YN0yIQC4lgZppXKxzzXqgFf0w5FTV97cKMy2l8O59pi1XD+1PeG90QmbvasGF+5s1l1/ayZ5GHtcJEmgret/UVTojaCCO4/KLq+gZInKffOwD29SQMeaoncC/xqmXanIwbYe97EpBdqjZo/6cc4XfaziOgBg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=nweq+a6/; arc=fail smtp.client-ip=52.101.229.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="nweq+a6/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZJbpeEOw2m5K+dPmk5sp7lwKuugAeUVhkxzZVsMSxTXin1Z/RiArcQxPA36hTvKwKvz34ahTHicCbRYiYXTyy6ATRUQlHAK7ccs26+GASUlCQzyk9rVM4sOupykztfwAMkdrPKLNCcC7sa+gAw82hb7WHHhCX4U0eW7hFHYNvUjkxZ8Q4LmxNJotssgSvaRksEq4OjZdjkzjikmRW31yh9pV8hDS4F94FMrIqlFq81S0XAeerpvx6z9V7Z+aklaip0qeridtm3leFH9OTXE7z8csUbndxr36+pS1bluZLH+ANUddaplk3wgmnmHoSmHQC9ODlojV61ReTie2GLA8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rP4F0Clhk3SfObkPvLD1YUWUHe1d2sPeo4jkK58D6eA=;
 b=rq64VU5QRzVsOznXhmJsRgpInwI1pnMR2FY+voXlLctaHYMxdrJ4qABrfwhmsHcubhQ7K1aTjqR0D8xhFaqSEDmouZErlL1nBaEQP0fsxQu6ypxiFA2joVef9+Gyby22mQFDE64DKbEANm62dPCnP4hxGRniz6esOjDe0gK92AdxN7mo+32ZK9w3FTweNbDnWIbS3mmpc17G6rjU/cKHAqHvUoJXU7vJb4Bu22fpHDSvtR0CDn+MBwC2nFwxsU+FO1DRy3fkQxFJsoGEe+LE13B2yhGK/7ZQD/b6OeUDTkzGjiQRqmkSKTK2op5zgVQBzQMwZSRJLg/91Tb0HVDGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rP4F0Clhk3SfObkPvLD1YUWUHe1d2sPeo4jkK58D6eA=;
 b=nweq+a6/hqps7J1eAff8qRmun7D5WHTTSG88dq9mPdbOdluSbPuw0VpCKmoG6FYFQn9oErar/V5dHJFXUtWa1GTu+ec2KTI4oYgv5BgEtgk58L3vazXSV2DVB0isAhE8Yu4UyADHGtrrmlqo5MlLpgkOMsk1jOdxEstZt+VvQIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7644.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:461::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 17:34:45 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 17:34:45 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/10] dmaengine: dw-edma: Factor out linked-list transfer start
Date: Fri, 21 Aug 2026 02:34:32 +0900
Message-ID: <20260820173439.2004068-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260820173439.2004068-1-den@valinux.co.jp>
References: <20260820173439.2004068-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0016.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: d50e45e8-fd26-4122-3540-08defee1538e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|23010399003|1800799024|366016|921020|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tE8/9Z7ClJgGKovc6ntevoN1vuTmxHY9mgXZ9+eUshaaxkgWykf2B5wMRkzmuJbzqdODZz84X03tBFtC7PISvoHG98OhxJuq8MqqIJrPmntUv0xJjUpP2im29j5f5xddjHXTtdePliauEKLXLIWWm3XAPYbJEvXSfzUCVk8zVY3FB7FwlHVyZZIjnM5bP/+jM/NdotVm4Q+2X/TKnFEydV0ju0rXvR5RJa1eOqDRAPdLtj74fJE5uhL58NdpIS+NyPyQYZjrZDfeBt1kWCQaaVbd+RDuTc0RFjr6h/ioVyg9ExNmFwtT2V2Ceq851Z7f8eNntvrqEwomXr8jqui9pr75HQLESL+b/O8NCEwCna1SfNJydgyPKrKPF7WaFM79l6Pg1y3mHDa+JG9iHWQzFFlc8g6il416tP9yPQI8vhwBWCmEcXRtRAkfMIlfyfVyTd4npzxkw4dVFR/pJByRcduaeeHR8rLN7B+U/yDZ9xQQZKSEoq5CiQcFhCIxCzQIeUpS11ply8EDLTxBUCGtL9bWsT0iq5UjewJwqureQ6XkHmZjBgVN1G5PfsNJgM/Ft8PSQiNHaw5M0Bzni1QP11Hhwb8znXBwc/dB+y1W+nC8MnSUoFvgFlEQ96LLxmHYFkuo0xFGKbWOq3lNPDLrp3ljTd6mISWn938IDtVJD/8dpbr7e5iCmMlUBdCtuoFD7mXuwB8f5Gr6juuLqJeJDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(23010399003)(1800799024)(366016)(921020)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Mqxys4xH/U25s62WywR8/H/f6+vEEnVk7eDDXyDCazSt+5cVnmSc8tLIG5L?=
 =?us-ascii?Q?4KBOeIWHJu79FsenqzvZvkOERxXQio2Wh2vJwsom+RRQ8Zt1hzuj5H0Ti8xi?=
 =?us-ascii?Q?XBbZXZp2mFSgkUHvRbV7qY+nvPO9QBpT26DtwosBSqVEWcx29vqB7ilHeOqG?=
 =?us-ascii?Q?N7FC6TOjxNkp5YzziwWv1UkjbZdZDdI4PaxJjuax17ReJ4Bh/wMkyg/MF/u1?=
 =?us-ascii?Q?XebEV7mRiK4ikZ4MqLwFfk312bdvcukUvq5/VuFzPYRWvpqfu9LKTrvKRCW3?=
 =?us-ascii?Q?BcsWpvUXhD4UmbbI2Y0QLCwbkDiArSfZFLRwnPnq/spNQR9vUPSHzOdM5LCh?=
 =?us-ascii?Q?petYBBPeKx6XGed2pLkhPsIxzEDfS8xbp+p6Uq6h35PN+ChzqzhlePPuZwg7?=
 =?us-ascii?Q?cusmRjZy8BBrEfZJzpZnYW6OTvpbXZWUaXGZj+XjFbvi1VLTf9JwWzHhu40b?=
 =?us-ascii?Q?SDRlwfQqV6+1pKXgpD17loC1bhqurt2OCF1b2h0iw1uauso9RcD0WazPGKYi?=
 =?us-ascii?Q?gOkgeQ2tbkGog01mhe9w/YJqI/xsYzrosoepXUtjV8Yg0Ioyu5pGUGEco/7B?=
 =?us-ascii?Q?qcpCHJDAQsHI4vzm/HuXdtV6d/cFCNAN5gvK8xaV9StAwXO1EdVYcMYFCN1w?=
 =?us-ascii?Q?Xl2519jDS6h0/yn+fuTbCy3/Zzi89dewV8vNxcNmtoadYciRObiyxqLsI+tj?=
 =?us-ascii?Q?89LSc/ysH0GCNW6BpGbEd0x4Lix+SQZJ94JKJrBpDpc90hk87gK61ns2jBGd?=
 =?us-ascii?Q?WATxQaIdmWNkxqUqBZIbCydc2d1Jj13Q0mAY5354pjODc0do7rhCTNGopNUT?=
 =?us-ascii?Q?rh0eH0pYh4f+s6PkNtqT0i5ygwIPoDsK9B9e2S72AgQtGgPu+M8INLaCv2rd?=
 =?us-ascii?Q?/Kt4Nte1bP0e2V47ghi/C6GCzIfjJ69nKrsEYCJayIB67dF/AazqYRDo00YG?=
 =?us-ascii?Q?oUl+PZH2sZq0RluSqDvVvPkVuwSFFjNA0QtWUAynCOIW5od9g0OVizNQEQmT?=
 =?us-ascii?Q?oRtNYvfcFIEn2Cnrctn6Xf2H+M2p1dMow1Dopb/QBlplXYn4iT9gwQjGP/x2?=
 =?us-ascii?Q?N0IlqP1eMnRCdbbGmSnV51aMed3uGN8eko7zaZffYE+a9mg7OyfHkOPxGZ8o?=
 =?us-ascii?Q?UH3n2eaZUqUag6odPsL/Wwmzhtger2JBBG0Mh6ThB3+X0pKGG9BJfpr/0Jha?=
 =?us-ascii?Q?CiPb+98hy55/U5VQbn7FQF15UsHfKa9PGHJIBwb+51Nzcdij3JCTfhRia2ex?=
 =?us-ascii?Q?wSqlgDnjOqqT56mNds+vGZmWZzs4Jo9j3tHIc5U+qwMlQLMU4jUn6XEViKBG?=
 =?us-ascii?Q?s44UOIwmVd+jnF40SqbrvCp3sihVeP4HGe2I20QcAmnUH1B0oGQvI2+lENCa?=
 =?us-ascii?Q?gp2obEnom3fQCDy8KhD8OrdYYehy1iS/VRid7i7tRnMlP86w9EksZ3loO0w1?=
 =?us-ascii?Q?eWR/ZKYwwx12UtxdEx91sEdQifKskG24BMS+60nOyIVXnwPlWwQQpM8CioI9?=
 =?us-ascii?Q?QWkfjOxtKYBXR+KOavxAGBEUrKuDV349mcX+Dl5HoSBWZNYP7quU2xVQvL4Q?=
 =?us-ascii?Q?iWPn7vlE9Z6dyqlYeTKwgAfPuywMQStBFKi+RBe0JoF9BqHfTi5L6ZDM2Uu+?=
 =?us-ascii?Q?NJT/KzxoKJiEmJ8QrrhyoahES748AwK5VuaBBLpG5OTmjYEauRhlpvJsCvva?=
 =?us-ascii?Q?dfXimVGG8TMShIgUJ3LgDQOTQntV2QGuPUm+IceS94CG0dEtATSGyNMU6X4B?=
 =?us-ascii?Q?icc4MOXT5BRXooXtN6swaz8P5Per/p1gVeX41+rl0m+mZhKYkWbt?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d50e45e8-fd26-4122-3540-08defee1538e
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 17:34:45.6942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Pu/TGWTmW3RxyWUlNVzn9sNp6nRDGY0LpWlSgOrScimX+xjlvXjJFacixajzjl4lTpptHA+ruz4J4mKVO+MdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7644

Move linked-list programming into dw_edma_core_ll_start(). It can derive
the first-batch state from desc->start_burst, so dw_edma_core_start() no
longer needs a pass-through argument.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/dma/dw-edma/dw-edma-core.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 03b2c2188351..a6bb68ffdfe2 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -67,17 +67,11 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
 	kfree(vd2dw_edma_desc(vdesc));
 }
 
-static void dw_edma_core_start(struct dw_edma_desc *desc, bool first)
+static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 {
 	struct dw_edma_chan *chan = desc->chan;
-	size_t i = 0;
-
-	if (chan->non_ll) {
-		chan->dw->core->non_ll_start(chan, &desc->burst[desc->start_burst]);
-		desc->done_burst = desc->start_burst;
-		desc->start_burst += 1;
-		return;
-	}
+	size_t i;
+	bool first = !desc->start_burst;
 
 	for (i = 0; i + desc->start_burst < desc->nburst; i++) {
 		u32 idx = i + desc->start_burst;
@@ -101,6 +95,21 @@ static void dw_edma_core_start(struct dw_edma_desc *desc, bool first)
 	dw_edma_core_ch_doorbell(chan);
 }
 
+static void dw_edma_core_start(struct dw_edma_desc *desc)
+{
+	struct dw_edma_chan *chan = desc->chan;
+
+	if (chan->non_ll) {
+		chan->dw->core->non_ll_start(chan,
+					     &desc->burst[desc->start_burst]);
+		desc->done_burst = desc->start_burst;
+		desc->start_burst += 1;
+		return;
+	}
+
+	dw_edma_core_ll_start(desc);
+}
+
 static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
@@ -114,7 +123,7 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 	if (!desc)
 		return 0;
 
-	dw_edma_core_start(desc, !desc->start_burst);
+	dw_edma_core_start(desc);
 
 	desc->cb = !desc->cb;
 
-- 
2.51.0


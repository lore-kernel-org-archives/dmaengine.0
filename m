Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020112.outbound.protection.outlook.com [52.101.229.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C510C45C70B;
	Wed, 12 Aug 2026 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550256; cv=fail; b=tEx11WZJb7IccCwQ+6Ai05xZj4bqXGYVCnaNsWxfeVyA/PklBYNIhNhEC9pp+87pnV65pCNP/QiYM+0BWdxteT/3XwihC2L2tKnCm03/B28d6EIfXs5qPv9i7TNRReHfVD7azn8F1j07b96T0DG8UZOUIUArGVcY9DSDnjqSJYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550256; c=relaxed/simple;
	bh=4OEduEHBjVr7Fs442YJBEJVKhItyTZwn87ek/Pw3ksQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wr8XMBoHS/UWQXeDcqnKq0v1EJJFl0st4UwDR6QaI2ZcvUsVz5ezMe29H1DpIc8AiAkZciS07HzuOPgCgPz7vkwDsvHiqVES1vmFSK4s3rxqc2iPyzFQ6SJZ1qrwvebW2RvQ1EVpvjBWVG7FGNebAo2e+h/cOQARRz0ACPysqSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Dx+qW4yV; arc=fail smtp.client-ip=52.101.229.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Dx+qW4yV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGvqVMd8TPYqFvBH0JB8xwvC5tSylLGWcZJ2v1mM59d9Hnv+z7KqGAi7hHx8TH/DoPtWkln9GYyQhkqLXwNMa95e9y1Act0oaJhNEQccuFbrwMWCjHOaedrcVwzXq8x/lBwmnVNV/P62sW5wq6GuNZcuPFCyOJGeReEgZSgM4/s8rkpGhSBq+69UUrqL5nhBsHEw/CSGJ79P8Y/9K3aj5Vio76OLsFG5oK9VPjjzedc1Dx5Gl9gwIxrnM9OigV2RoPB2LHQpEXdBQ0LAd92UY66f0xPwMX77eAp6XPw3MdN6QJomb6iYayTK2tJfJ2XE+haHSBo3HlANEvmBeIzMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgezhNz0+YTzTaj5Hn/gMkAyBPBQaQ3mEHVuBWk6mrI=;
 b=Dmo6LAqO+zSEUwcwIG4K5psL9FFbPGU98VH55cCI1Aj8bnbdtaRYZ+ZB2bEoIVBdM6SxqQiUmSfu1XXxZoteYLt5Gucq0Rg3ed65m/Q6PrLN223PD9U/2A8HBnrr8wGMZMnAJF/SPtjDsMUJGNhO3Xf3O4hprvCs0CVmgn9Gb4QebPWGWJW8vQ36vKDUE6vP3IkPD7bp2+uri1Ww8BupaQML4Gk/cCjxJJzNcE/lw+79AKVW2nM+Q++thtjj/wrdxqFdTGpawTSAz2kx0AmIRjELmfelrA2PMQ8cmAOZKrgdw5l7BW6lGB/Im81vOTFADNAg9v4O6MsKGh+ygTThyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgezhNz0+YTzTaj5Hn/gMkAyBPBQaQ3mEHVuBWk6mrI=;
 b=Dx+qW4yVScwA3bGMfalMGe1esHSvLVUKhMIyUvxkLIxn6xTc0UOebvzx9dLRzz2bFsCLHfHAyAVKexMaG9ddnk3wRxqMhTZTeWKdbivqqo7F+IZB1dCpuI868sjBCtDDkHCSsG9E0IVECdo07ydhNIm6k+ApI3MaTZk+KmdJCtI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7115.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 15:57:28 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:28 +0000
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
Subject: [PATCH v5 03/24] dmaengine: dw-edma: Factor out linked-list transfer start
Date: Thu, 13 Aug 2026 00:57:00 +0900
Message-ID: <20260812155721.2807506-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bfc65db-ddfa-4ef0-bbc2-08def88a6931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10070799003|18002099003|22082099003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	WrdiTU3qjgGiWurhJ78+inuR5A7Zm47hmuJdaZFQTuPw7Fu3m3r7EiynAVe4E7LA6IeaCE7ViuWe4ZvC/qviPAqxTlAU0j2GmndVK0rXpT6O9R6o5DuanbU7izjPcAXfQKKWeTYR9rz+54l+ONo6le3c9/9YRVuxV/6C3T+SiZzEqqBC8eWjWd9BguD6BNjTtpdxHnCXF2yrKVvULvRH9abo+4IXrs7Vf4Ihzz6i543OHWVu4qSj8V8ujyoB6Eb6Y+480jpqZIjK3riI2nMZ/n4D61Xnl86vftr+MOEK0GQSqYlZAdLgTRM+StQh5hvin0ZY5fAHJSdIrNV+Eg5fPXaSwYg9GqZ/G9JBVSBxoBtFm/dja+18t7aZgZDtQ23YpG08dQY2CgnQx3xFfQuBpWaRQBFrG2Bcf70KUozrEdzxX/eD9VHIYfBwCD+dMqxorKcl3sTw8/ZGxbRV+WESs80tBov8isLO0PEZaoCjkmXTu4bIzbyHN2XZdu2A1oJeImMm9iCUEXk5FxShqqueT+WnJI3NRulKr2Bh+Td/qTVcEcfNKU1M6jEPH/2yQU+vM/ZyPMd3fSFLwCzm94FK0ivFMLdKXJ+/Z2ND6L8p+jGNCmS8fVo0JqORQf4/aATlUociRQM2JA2volYgPPFTx8JwSvutjSVMUAUC0kkvJrQ63GrNRZ4vOV1hYskdTlsm55vwmvxz99b6qNtvvGfbmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10070799003)(18002099003)(22082099003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5K+YcDYpvV60er2LuRW6kIV+dMFL/u2fMwSSAqJxlIXd16/1FleSHzXlLtcq?=
 =?us-ascii?Q?fsDDA2/byOnj7FEs8FtSRwbY1QMxZCXCJ3ic2Q3gucST13f9m0EH4gGn6rka?=
 =?us-ascii?Q?Fkao63ECTZI1P9djDW+gk8wDoFCrGzC2MXCelKiwNyWAYvdUcQ48XGUAqJH9?=
 =?us-ascii?Q?eV/WlV6eN6MscTjbLfGqn2zJpUR/5X9WehADHG38RNyVEqE03gsfIse8Ki88?=
 =?us-ascii?Q?+5Gzo8JwlFm5cS/wUZJJ8jjJXpl7cWrlbTQeMrJkAvZoEnp0a65e5SvXmVK1?=
 =?us-ascii?Q?KT5ITtUotL9qlumSXyqE8kbMf9GSJbx6XqkR2/RyBZ/vc1iuN84+eV5/v3EK?=
 =?us-ascii?Q?X7lBIXNVJ5xpJjhmMat5iNMVl/bFPC6mIWcCuTdmrQzhSeVjpx2x3MT1/5ol?=
 =?us-ascii?Q?9CFTaB4oboUcKLqESgOTPN24JP6OxkkD+uDZKr0aC6xnrxNv2v4qxePnmL/Z?=
 =?us-ascii?Q?J0HyDjWs3BvXqYG9+XTc6STd7snNf3qAOG/G4nY7frgkhICuEDCf0elYzDLF?=
 =?us-ascii?Q?jEjTxVRRC2v7B0zE+9D1bf0bgPZlOp5dmUUZBB8zIaEEqPPSsAcDMFw5Vdv/?=
 =?us-ascii?Q?b1I8C1IowBBGNSs+Oc8eeoK2TezpLNamoKEoB9YHuLnpT8V2U64NBZr2XY2q?=
 =?us-ascii?Q?3zhLvbVwvgghohjVkxulpwWGfsCN5cWNDboYS7b9tGjl88iJaqqKtZt8gx4q?=
 =?us-ascii?Q?uvNcTnkoP3InFADDv6T/v2gzwU7jxuEUJqHmWojGBvPRyEhh9B5L+2XhA3lh?=
 =?us-ascii?Q?ZAjlDdO1QhexqOhcqMYNUmB2QWUedPckDkwCOaUxRFKo3u3S8xtqGhidbji6?=
 =?us-ascii?Q?Ywj8Vrc4EjnOKGypp0/z3C/w5kkFvdOAFsy7a0cqPmfsJPgKgxWOsfuu7z86?=
 =?us-ascii?Q?HcR3j+ssPTzmg1GBXrR1hoid4KE2Ph3SI7cItzxdqOXuARVQ/fMb0ibawCIb?=
 =?us-ascii?Q?M9vY/S/HO6Is3AzZ1MV17nrqzbrWaYfim9UCPOzdYCIIPhNSQzX7+wQCJV0D?=
 =?us-ascii?Q?8Bj+RHHBo7W66U+8uqSzuXtRRMkJtCUz3lR6Ec9gqeLzkuphBSyRjrsd2Kvg?=
 =?us-ascii?Q?XjWeAeuP8B1gG0kPkM73XcrQvXKGnZuZgqdKAG9YXDpck5ZScUJmPDjFxkB5?=
 =?us-ascii?Q?O2njn5T2H+Cj8CA/7wGXmiKf09L35rbCvl8bKZ2LrKkrhBlN5+vBY2T46HPU?=
 =?us-ascii?Q?fJZq+86Tbdn/v82w3Ab7hRXgHT4NGOrZ3Xkm8Iv8tDKrNqzoEUMBdxNUpqfI?=
 =?us-ascii?Q?HuEDxRAtnCujIC6yqgQmZJ1/1F7lJITSwtB1vM/J/kQWw5FIWdTg4nvxX2P4?=
 =?us-ascii?Q?muPFLkq7CBsaDJl1smzkoBe+C24hqzDPFDY367kBORnZPIPlDZNy25Bv2TSw?=
 =?us-ascii?Q?iprPXk1K7CcQYrowrx8SDyGKdDMuHsQbBT1eOWik7DjSDxaVHFnRQxI6w3jm?=
 =?us-ascii?Q?1twO76S1Ia0GGurF1/WPWKk5La9BOfHyvu+COfmucKksAxDrjx76rOo0avAz?=
 =?us-ascii?Q?e1PN31b8cj86Sn4GU1VshQwzwWUKsx8gMLtJL2GjQv9ElmSYz4dQhyT4koCS?=
 =?us-ascii?Q?i8a0Q3dJKK4UsS5TyRYSCtcWDW5JlHQO4dyF6LIkfR9+pzmrEfLnX25zzU5B?=
 =?us-ascii?Q?/WfCx6GgbEo3m5QWbACnw3N2Md4w12vGUkZTpgoJ6ndClhP3h3BGhdH9mAx/?=
 =?us-ascii?Q?z42Yq7W5raLMYK+G2pysp+p0/7rVw5jirmlhAyyDh85x7AEcyoPdxmFElmN5?=
 =?us-ascii?Q?6JT8U9FGxpkuRf9iiKGRqyFNs1FgRVJosD6aWWfNqnEsbzm12DwL?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfc65db-ddfa-4ef0-bbc2-08def88a6931
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:28.7727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VizInyetycHATsrlscDvqeYQTo9k0R/k55ptMNjMdnm4gcKzCtPn0UkLUBI7S1RDTh5XIZjZSBdO76rwdOuDGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

Move linked-list programming into dw_edma_core_ll_start(). It can derive
the first-batch state from desc->start_burst, so dw_edma_core_start() no
longer needs a pass-through argument.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

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


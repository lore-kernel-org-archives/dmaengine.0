Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011045.outbound.protection.outlook.com [40.107.130.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9294FE2E9;
	Fri, 18 Sep 2026 14:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741136; cv=fail; b=lrysP2dO8ffl1PsWK8qm2IdoLVHURmY8JtJR8u6z+QdQ4LLJz+rEnYvmFFGhbijunEsENkQFeu7C11fUIoOA4MMLzngNM4DH+G4czfoLO66Zkl1f170e9GgGHa9+MaubIVE49w3yc0+Gu0pAoZUH4MrosD7LudyUQ7vLHxoDWkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741136; c=relaxed/simple;
	bh=OypBXPtzrswXKrYYSIleLhyhsgQUru+N2ti2/Lnp4pA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MId05U1FiiD/zuNEB3eGk2o4bChbde4J4GDDSWqb377qDX0wCpBjcObicPCsR0cYknq8n9B2Bgmz1dccRrr4gNoM/hUXHxxzh4JzHAW+4BghznfYOkQz8HKH0bDtNmhgDY47J5jqpvBzkVsWnmnf9c3YBovdrMvmHRIy7BY88UQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CkDtd2+o; arc=fail smtp.client-ip=40.107.130.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CkDtd2+o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJc1rhzBWdibRCbsWaFtDFZnYZl61oDwBOslB8khPgufOPVJjVVYNRd7i/B6yvpmJ4LrGdsi2VaxaPbVRTV1vfOp1MvuHwQELKEgYkMVU3GDcS9NvfdtC0sJosKsJGuJYJWxAX1A/3EIQ/u9hMnno2+bKR2vAobjwIMs+/7N8aIHwp4HG3+8wnk4R8D8ACFbSZacifZyvaRvEXIUP57zpG/yLtq661lHyfG5oixm+866JHDb6JWKlkobygnmNFicc/BA68E0zCbO+jPHRp/SYtAoJzn0n2rsvlw32cIUr5vDtzHiOQ+HVRUbyP81lRJz6eS4OHBgHwnUO549Tn2vfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaVcOjbhUPWuvEtYBVxx8OoXpNv6Hl2Zi3IXRG4f2u4=;
 b=w+v9uK8OYBbaJtA7NdP6tAIfvXFd2ezkAZ+KBb/mNRkzjfPTFZv27dpWf9uZ++TCaDfZdT72x+kx7uGfrVgmGPO+cQxDcodiNXIvZVVpEcmXqQuop+4QoBJ22ZnfY275Ybd2t+nfx2LGUONQVrUUAl3BCRa17VzAXSooBg7+5XQ5y5AeKB2h55cfb9lfR5uDEhUCBZTd8LmjI8OhH9ZQNF0W6fiOyHDdbsKluMRFHmkMuLnPqp7CoQXq3U18t4Vkygm4LVLs4B018lK/uJu0yRYMQzNER9PMUU5E5nlNGW2QzXdXPDCtYN8qHDGLiDAhLwUoW8w++jXgep/jr2YOAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaVcOjbhUPWuvEtYBVxx8OoXpNv6Hl2Zi3IXRG4f2u4=;
 b=CkDtd2+o1lxAQ5dPTcj6D9OOF11eum7I1HeUDVFBpGUmyp7BxZthxynSbkoA3pcrkx8SOiRPgwiIhKnbgwFUd971b0S0YwbTxsXFfa5H39UWeCfLnANyXzuTvpQRUPzAsnPd+0jE5OpsYjSqS++OF2sHuXNHwIfJpuqc5aJADfSVZD/4YgwLYmXoEa58UDKltcp6CbE9rBUbdNZTtt++pCy7196IjDPiiFZeG22fUCdUGT6yBM9knWZbJjkCzXD9eC8hRlvAyMMENC3nMABcEWgRIbNHIU1OQi1DMNQPIdsO/gc3LGs7TJesRxI627SawxLQiwMD9OqX3Yd5NwJ/jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by ZR6PR04MB296659.eurprd04.prod.outlook.com (2603:10a6:910:e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:18:49 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:18:49 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dmaengine: use assign_bit() where applicable
Date: Fri, 18 Sep 2026 22:16:17 +0800
Message-ID: <20260918141622.3022876-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0298.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|ZR6PR04MB296659:EE_
X-MS-Office365-Filtering-Correlation-Id: b3afbf01-4ce9-4890-46b0-08df158fc21d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|19092799006|1800799024|56012099006|3023799007|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	b1Jfc9/Oka5uX0yMHLFp6Ti8L2tBclY+TVWRR+QYCRA4f/ciOuhvuaWIhXuiWgWPeq2A8mq0mGz2iUUyQrhsYSHySDulW9SEGG6ZoZ+aU3/TmFfb/97o8Zoyin4hJ8nJyYB8/eeORbwkW7H0iXQjbcF8FmvkftYIw1E+9jOWUtOEmE65VmmJeYhkoCVsCaLnBpxaTuyvCo31WZ6rEmO22ESva1AhizD8K1MbrhoeDvJLw93tn/SlJHvor7ho/axywpyrrxz+bf29T/kOSfuSgYWLR5Q9qNJYlACmJOlO1pLpJwACAgAF/om+L8C6+LKYAdNh+iXJPg0OgmtrBGC+NJbjwGCb6k/wk91bTYMTDhCNDb9t9kY3WawHjRFFhY6GQSGLV19qPNaqmLph8/0HX37lqzTq78QJe+1S+I3+Z3h2WeZ9g1YLCJjmdZMDyUt0V3J94XdZ/pGbJAJQavzNmpGvDF8WgMSd8s+RWYeosVT3OIBLNXxW5hfaGo/Nimspehss0zUn/EQYjEwJJK4cNuhwD8+woqMNRKWJ3+DwVFkdfHV0fO3npkcDzJVkqC32+1sxp7rBfAdDRe9gIMoe29Gbj5FOozHClz8of/CldyS72jVkWFB/k8zzJjjwpJ2n74a02MFHLmkgelNplph2oQVigfSd77B6BmGIK1zonxE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(19092799006)(1800799024)(56012099006)(3023799007)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qyISotbXZGOvLf7+raPUDGdCVC5S8fpuIRFrNkUz+ufLt1tvn1t2GmiQPC1u?=
 =?us-ascii?Q?Q77hmXZ+jZVimTyhmOia2UX/PvN+KjNtf9mWDFAFNMWQI3trIgTUynlR52Bd?=
 =?us-ascii?Q?I5YQ6OZvNRR1FfuzC93xBPVlJZrPCHWlREhpXi+NzftQwhtlB2gIzh1qoofd?=
 =?us-ascii?Q?cE1mHI70EI9isEc4czSo/iJsvCKZU1/yN7EWJHJmH/VldQobK9FEzlHNXoXt?=
 =?us-ascii?Q?Y6nVES4/RIuU29C2qVIa/RTTFdSyk7vfWOkrB7UpFpsa1nXqx3oF7FnZr7qn?=
 =?us-ascii?Q?JVPutRwkkFlgo0Ub+F71n3HmciLNpKmnrvpU7GesOsti3BSkYm7ZcOaX9o+o?=
 =?us-ascii?Q?srcPEhPKqEpqmq/OSpoQBl7cBqd/iyA4Q50JEOlY/qhdrGzXcmJtHRVn7aXn?=
 =?us-ascii?Q?veuc45XGs845TNQuiVcpULgstJhhMY1Vl7s9/sqO/bUlIcTC+o6RPJT3s8zm?=
 =?us-ascii?Q?fvXUGtrIc1Vb3ziIffAgj+uLix4wwQp6LpX4St2Rj3HxJa061fFQPdG8+S3h?=
 =?us-ascii?Q?ULO29qhWErHZ3aU+NPVdrb3/Dvdu3xsIVwMrsFcCjlCvakOkZAq6vbDcQXh0?=
 =?us-ascii?Q?mrjLgWnbdAw6LStj119ji82b9kstmHW9w2EaJ76x87YxO41XRGKi3KJ9Q/CO?=
 =?us-ascii?Q?fntT8Ngl36+C8pfjce8oIwbp5Qnk2PE4rnUGK1nea1G4htjE6ugNF+gFeP7w?=
 =?us-ascii?Q?PKNcLiFRbIuOXskeVcoJ2xgKG7oAoIU9rJZXMlVKCZP/nIi+gKZ3TKHlsIt7?=
 =?us-ascii?Q?sgslyj0V8fNVg2JWS/TEz2P8dq1bhuAh3t/lyN8Mqdf4ZOAQb2rv0eSNrZbX?=
 =?us-ascii?Q?svfeXX3lHUhsqviz5YyMsdx9KEX04hlMyxv/MjCQZKOBMVmP6fkiov2FS6yw?=
 =?us-ascii?Q?yQDvaqy6ADVxIuslumBzH8qpBMZWRkjJvG7imPiCxS3POZJIVqsJCcBTnSH4?=
 =?us-ascii?Q?AfVfU109Q2uOxuHFxHmxvdW9xnoaQE0eyxwexJiGsoLAx1BiXyVexDewpmON?=
 =?us-ascii?Q?Hx0G1EHV76ToTnFp8P+3B/290GPrCwLkkJTR9erho1Ee+otFz3EfRtzKQjG+?=
 =?us-ascii?Q?uNQDkkls2Kz4fDA12jpvNfQsH86FkCpkbkC9UQlMrlzI+vU52MjxScrlOsOe?=
 =?us-ascii?Q?6pr6GNJZyGlvZNkWVfkpmicIs+sSUKOJwcvg94I+5WGK0d2a6/ekitY7epoU?=
 =?us-ascii?Q?yPR+LU510WRj5lot9JzPDH6v29SW/wMV2EGyUrAPnDkOU8ONJ38iDAMuTZ1j?=
 =?us-ascii?Q?cD1k/QmDDF9Zk5jpFbgi0jjfqaHdgtIW/36s0WFcH8TFw0EK4R8A7Ehmg9CS?=
 =?us-ascii?Q?TU5r1/mbFQzPz+s9ZbzQx6B/t7swFVF3xb184ULM2lYIDYTGPiNNjBYwDuZ4?=
 =?us-ascii?Q?brXKFuDyt6KmlnCP4zdlBqTEMzG+ii3qWOdNzlsmJMJZkQ/YJbtDLH35En4M?=
 =?us-ascii?Q?9wbglL7WrR7ZLIyj+rh1x0kKK+4u7eZvABYze7OODJ0rcLmehUVwB6+qhy2i?=
 =?us-ascii?Q?e/Aks7PxUtxTpbuIT/nW6jwDEhMdVyKplylVOKoIAg8sNQnAqKw97EEJD0Ev?=
 =?us-ascii?Q?uUi6rmlctVdP/pdLmcN1Lto8qD2p1LlGPFGMflNRBupvBnNSAekfDdn6xLnC?=
 =?us-ascii?Q?stCnrOYEf2ludnRsK754FWVlqlCFQshZbRHBJGW4KtrLbi9FCUNHZeAXigNW?=
 =?us-ascii?Q?Kh/Er2dhftekOaLJPL4RUzwJyPQdeGe/ub73pj/yL61bpqhDOjxL3MrukXrj?=
 =?us-ascii?Q?Jg0lBGq+zjLqSH3cZJeNCXDpAUMCVPl8lBszuHq09dIJ8LjrXbWi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3afbf01-4ce9-4890-46b0-08df158fc21d
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:18:49.4854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1P6tLtduSqs518Fqu0kV2qSZJGbqebvcCvKQ0mKFbUt8f1gymOZNLDRuXC+H46MmP1amTGuEmHYY2l1bUw2axb5284nJPVloal7V7w6F4YgD/IrL89+xKyLsi/SX3WQL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB296659

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with set_bit/clear_bit and their
non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
API.

Done with Coccinelle semantic patch.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/dma/idxd/sysfs.c  |  5 +----
 drivers/dma/imx-sdma.c    | 15 +++------------
 drivers/dma/ppc4xx/adma.c | 29 +++++++++--------------------
 3 files changed, 13 insertions(+), 36 deletions(-)

diff --git a/drivers/dma/idxd/sysfs.c b/drivers/dma/idxd/sysfs.c
index 6d251095c350..2b0524324089 100644
--- a/drivers/dma/idxd/sysfs.c
+++ b/drivers/dma/idxd/sysfs.c
@@ -1095,10 +1095,7 @@ static ssize_t wq_ats_disable_store(struct device *dev, struct device_attribute
 	if (rc < 0)
 		return rc;
 
-	if (ats_dis)
-		set_bit(WQ_FLAG_ATS_DISABLE, &wq->flags);
-	else
-		clear_bit(WQ_FLAG_ATS_DISABLE, &wq->flags);
+	assign_bit(WQ_FLAG_ATS_DISABLE, &wq->flags, ats_dis);
 
 	return count;
 }
diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 36368835a845..b8a91a0343b5 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -710,20 +710,11 @@ static int sdma_config_ownership(struct sdma_channel *sdmac,
 	mcu = readl_relaxed(sdma->regs + SDMA_H_HOSTOVR);
 	dsp = readl_relaxed(sdma->regs + SDMA_H_DSPOVR);
 
-	if (dsp_override)
-		__clear_bit(channel, &dsp);
-	else
-		__set_bit(channel, &dsp);
+	__assign_bit(channel, &dsp, !dsp_override);
 
-	if (event_override)
-		__clear_bit(channel, &evt);
-	else
-		__set_bit(channel, &evt);
+	__assign_bit(channel, &evt, !event_override);
 
-	if (mcu_override)
-		__clear_bit(channel, &mcu);
-	else
-		__set_bit(channel, &mcu);
+	__assign_bit(channel, &mcu, !mcu_override);
 
 	writel_relaxed(evt, sdma->regs + SDMA_H_EVTOVR);
 	writel_relaxed(mcu, sdma->regs + SDMA_H_HOSTOVR);
diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 279a431ccae3..39b1c4fd9ca5 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -350,10 +350,8 @@ static void ppc440spe_desc_init_dma01pq(struct ppc440spe_adma_desc_slot *desc,
 			 * of the transaction (src, dst, ...)
 			 */
 			iter->hw_next = NULL;
-			if (flags & DMA_PREP_INTERRUPT)
-				set_bit(PPC440SPE_DESC_INT, &iter->flags);
-			else
-				clear_bit(PPC440SPE_DESC_INT, &iter->flags);
+			assign_bit(PPC440SPE_DESC_INT, &iter->flags,
+				   flags & DMA_PREP_INTERRUPT);
 		}
 	}
 
@@ -508,10 +506,7 @@ static void ppc440spe_desc_init_memcpy(struct ppc440spe_adma_desc_slot *desc,
 	desc->src_cnt = 1;
 	desc->dst_cnt = 1;
 
-	if (flags & DMA_PREP_INTERRUPT)
-		set_bit(PPC440SPE_DESC_INT, &desc->flags);
-	else
-		clear_bit(PPC440SPE_DESC_INT, &desc->flags);
+	assign_bit(PPC440SPE_DESC_INT, &desc->flags, flags & DMA_PREP_INTERRUPT);
 
 	hw_desc->opc = DMA_CDB_OPC_MV_SG1_SG2;
 }
@@ -2136,10 +2131,8 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_dma01_prep_mult(
 					chain_node);
 		memset(iter->hw_desc, 0, sizeof(struct dma_cdb));
 		iter->hw_next = NULL;
-		if (flags & DMA_PREP_INTERRUPT)
-			set_bit(PPC440SPE_DESC_INT, &iter->flags);
-		else
-			clear_bit(PPC440SPE_DESC_INT, &iter->flags);
+		assign_bit(PPC440SPE_DESC_INT, &iter->flags,
+			   flags & DMA_PREP_INTERRUPT);
 
 		hw_desc = iter->hw_desc;
 		hw_desc->opc = DMA_CDB_OPC_MV_SG1_SG2;
@@ -2221,10 +2214,8 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_dma01_prep_sum_product(
 		iter->hw_next = list_entry(iter->chain_node.next,
 					   struct ppc440spe_adma_desc_slot,
 					   chain_node);
-		if (flags & DMA_PREP_INTERRUPT)
-			set_bit(PPC440SPE_DESC_INT, &iter->flags);
-		else
-			clear_bit(PPC440SPE_DESC_INT, &iter->flags);
+		assign_bit(PPC440SPE_DESC_INT, &iter->flags,
+			   flags & DMA_PREP_INTERRUPT);
 
 		hw_desc = iter->hw_desc;
 		hw_desc->opc = DMA_CDB_OPC_MV_SG1_SG2;
@@ -2246,10 +2237,8 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_dma01_prep_sum_product(
 					chain_node);
 		memset(iter->hw_desc, 0, sizeof(struct dma_cdb));
 		iter->hw_next = NULL;
-		if (flags & DMA_PREP_INTERRUPT)
-			set_bit(PPC440SPE_DESC_INT, &iter->flags);
-		else
-			clear_bit(PPC440SPE_DESC_INT, &iter->flags);
+		assign_bit(PPC440SPE_DESC_INT, &iter->flags,
+			   flags & DMA_PREP_INTERRUPT);
 
 		hw_desc = iter->hw_desc;
 		hw_desc->opc = DMA_CDB_OPC_MV_SG1_SG2;
-- 
2.51.0


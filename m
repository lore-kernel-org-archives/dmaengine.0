Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020112.outbound.protection.outlook.com [52.101.229.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1743002C8;
	Wed, 12 Aug 2026 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550263; cv=fail; b=lRG1oqvszGjXWALIhs9RlAIIWowp8GDpOuDlFnE6Oc/kvqYtsVDDWd17gVNGIMPO70xmROH3vDoGtH6SwJKNb873esS9yeKa+no8FBUpX/etB+z2+MUuAgLI/VjCufTHNk1DE72REdN/YgW5a7J/TKhhULr1rDA6fD8Quax3Wpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550263; c=relaxed/simple;
	bh=kPa25jWyM9CKbEUDlQ9tY/p8a4RHvT0HsiPfuiW2WD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F+Cv2Gl9iRyW1GjmbsyO6N50EZ5E3FHiqRFBtFvbm7WNW/EqZ5uCgv2IrbxMxKzP3dqNmB3gow10sBhmMkgAxeAIGS1WQ4USVVV5odFNtygFZd/Xsg2yrgFlWl65xwX8IBWngY8VJOGYC9rUgz26W7CrT5da2nh3y5p0Fv/l4is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=vYlIoPZu; arc=fail smtp.client-ip=52.101.229.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="vYlIoPZu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnS71RJbbu/DyHjbcpjl3mbecEmDzNViXrpUeW7095Gps+elAE+ARkzHKN4VNJ75apVh7zNLwZ0Iv7QooiB/M+th4Q1ckjuCZtSpzGuyGd2RaSpZsCJBytHEsKL/HaVaBs1UA04b096vJaHceQ9DQ8RVbJSi6f5z8AuxtT9G/EiCpjYak+MZ5dEzuCSB+HthTswLQJyvOJd3foNmA8fqL2iaqrqNYZBqbtVwi2OluQZs6RXQeSzVT8q3s9dnE4k2ELPGSafWD5QFWNAA4jlH/LX1kkEs/eiJSiMC+casuFOw6JGoZKLB8VqBZkFkdLyzsufzt/6Ls9bv43BO0YllCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egqeyCBg5xIHB/5glkEUqDDyQNn4M3mET2n8VZZ+ckA=;
 b=Ed/vYN4gHm/Mtlw1LFy0dxHAoDh1B41ITuoJ40hjCzi8xRwMVMseif4I3Vm7YTwznj/J+JFGZJw9zleNRhueTWBTwEypRfYXrQdpCIm5NSYM4/BFFLF5wkyUZXd/RxeKunwsZnUCRm1JW88UduVmFIqmZUkeDjIfnXQ4Z4ibBXXoH6j6WVHFj3BuCUq+mYO1ZRIM3NwVaYrzY3SU2uGL4GMeje6KI8GbrvBq2mM8NSPvUjYsL0F/LNiOJeLur6AFAIcHqEpvr3Y6co+yppL/+Nzh3OVfHueR0bnKvIoNCCAFaOFgfqmxuCNXwRUJdNWetp9GEqVX1bvl1PB2wPt2dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egqeyCBg5xIHB/5glkEUqDDyQNn4M3mET2n8VZZ+ckA=;
 b=vYlIoPZuwT32bDgHZSA7v3O9pL0+Agr4FPAazfHzpBuz5Iw3xCK5wN9TSB752LtaIWu4xckeHAqQEJYYIXMFNiwhW1HMAgyo/6vq9IoFqIMAwdUqapKOcDGLvBgtQv3615T9I3fW79fF863dOGMEBCIn9J0HIrfAbMJk6H5e0nM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7115.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 15:57:32 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:32 +0000
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
Subject: [PATCH v5 07/24] dmaengine: dw-edma: Centralize LL doorbell decisions
Date: Thu, 13 Aug 2026 00:57:04 +0900
Message-ID: <20260812155721.2807506-8-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::14) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 9025e07c-825a-4ba0-57d8-08def88a6b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10070799003|18002099003|22082099003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	nWVopu2GJJdHi4EoHUptGRGP/P60NsUfTgEe15oWfxIbv/8fe+dICQncLmVLknf5w0yZnELLF1n7I0qjJE2ZMEq/GkF/TnIrK06eAOy25KyLajX+0R/yyKPpYc14YDntOKUpP+RgJUpgdx36Y+L4otP09bCEvtKKVd4gF3Oh5gwC0fNQIZwxMnKmLT72u72KRouczVvhVwS8Wf/DmlU0MTDR+6ATT9qXFhK2Eg9wi0av0g8APZ69u1061CHyABOy7V3TITh4PJqA4DLq2aigap9na9MMKUSk/ioy61AlTNXqcODMk+5Wqzie2AmbrXtVwoO5KM8MNFOF9TS/I+L8ljpJXRZJ7z8Cu0vnR7UgTbQJSXn+e3DdXxJSU8sPCjYl4VbsJwqu9WvtTVdBd9ANX4P6wxVhnFx37PHBd16fhewVHLE+p32dHbvq/LJyKDXmV3qV9AS56MCzBJUB2OMI4YbgtWxtx0sfCU+H+CNw0nu4vtrZqRj7nhazV6vLKJHzpt7pMGh+FNccwD2ByVzwUIL83n4n2tDFZPbxyejhjL2Hr9f8mXGOacBzYE2obhWu/D8oS4Pn2K9znHeYsmL1tV37RQ5QXvIaXuC3IeDqV8FU8SgZH+R7x84AvhIyn0d5Ebbz2FpKyLy9jfrIgXN4PcFrHeCYlj04ENRhG9o0UUJ/ieldcmazbNWIlczfr9rG0n0GafBUTTIiVfOc1vB4DA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10070799003)(18002099003)(22082099003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sg4+p1eoU6K8nK7Sc2pudLPDXflyp6FvSIgQotwDwSCuJG529Ce8YGkTA5Ec?=
 =?us-ascii?Q?+4H/8mj7ijtbuZem46CZF78t7ufNFa9eHJ2GJ8CKGxKHiV6ujo59QjiMHz+K?=
 =?us-ascii?Q?L1PN/h0pcRzD2Jq5WYMx0r8QjAcGsxbeRFf2g63eeqdujUpYu9A14c/IbYWx?=
 =?us-ascii?Q?VwgUca33tv/YbMXOoIyXYq6KY8UV5xjWP8bVr782ZJE78dKDzNYTLhXBhycR?=
 =?us-ascii?Q?E7Ujs9Ycr2yzj8zZho7T8R6u5cmLRC88OW23MzEHEh11EIGZB0CWIgf1gPjF?=
 =?us-ascii?Q?YtCfqQbhHZcWePNcCaWrIbqZM4BFiXLMrs3ynM1/UGgyVZ14zb9jszqYRfW/?=
 =?us-ascii?Q?JSJo5uktE2ggx1RMK3EgwkVS3p1eFoVdYri4Sle3CNhAE0shhwKsp4jY2r2X?=
 =?us-ascii?Q?NxSPOTX/tyT4ubL21SMYn8+bL89orL0qxuN/Sre3eN9ggcLlb9TmqHhrZ+rz?=
 =?us-ascii?Q?ALpeCTJFW4W/xfCIIb67wICfGnZPNiMiGRfnYGxxgjNuNL/WTM3iWjYGr4mX?=
 =?us-ascii?Q?Rkwe/RUSgSf2xW4n7HP4fUoDSMYACbjrPHbkvuyfS4kwYfNweBFLTYhL2t+P?=
 =?us-ascii?Q?omA6vM2cqzNVwMRMsOFxgk136t9+4W5xefUs3SH1hoyfzNc1XgkBZHQLHdRJ?=
 =?us-ascii?Q?bMwkKAbkT/tcA1FKgRYE2d1aqaAlatfCjrBQxsVeeuv+rteIKAyMqRoopFBB?=
 =?us-ascii?Q?9WGj/GH7cVP1U+Tjs9cQmwiWneVd3tFE70xUMuUz8zjxBTkypBRUfIiiuJJY?=
 =?us-ascii?Q?ZNSmc2JY91BHxGLUxv+vb42qXp3BuBFVR1doj2uyWiT2eHO7U5qsCCioygoY?=
 =?us-ascii?Q?DbCTw0jbdn8ltax7Jk6HmJRU1EgEydAEIQ6BodYutl0fbtRm4nVOmXX/0Slq?=
 =?us-ascii?Q?vQ8QLYAl/dQLt9+9ZEs8a3BORMyWmb+i6IC7Fil4PKavMCZ94+Q/Z+tDO+DR?=
 =?us-ascii?Q?Odhz9W69FbBM5pFScrAFp1ODdOHDpeGwgtakVcPRKM7pWy+5Fni9xPWsaMkc?=
 =?us-ascii?Q?gszFWw9r00o7DIvj/vEJVK2omzv50+Ry48ZNejicn0NHkWxvfh9WLvq9DxLn?=
 =?us-ascii?Q?h2wDZNIzlbonxtcxdSVqM/CSMXJ7uisdaTHOVtg8CagwRsBJILB99yVKX5Ap?=
 =?us-ascii?Q?KRznK7CeTzVPmgFf7MO2pY2CRxuN7KRTviomvj6Tymt4gjBBOpJDdBCMi1/P?=
 =?us-ascii?Q?CApNjUkQCWgX9bkHPtRnxBUrw1ZDdPjmEgAFmHq7RAst+ClA95BuJ+wwdTRr?=
 =?us-ascii?Q?6PD4Q35a/3ZfKd3hlPEllTsLn7yzci07fOwY8IiAjaY6xG2D8AmifPVyIGt2?=
 =?us-ascii?Q?UP0Ho93H4J6fkLLmtj/eYNveS/OawqLBgr1ask2bgGA2PuU4xmG1qvs0bbW7?=
 =?us-ascii?Q?vc9OtGjVYvOTK+nRmkQejFoctAC0X2P5/Kqzxhvu/qhyByWkPem2Yn2+3lqB?=
 =?us-ascii?Q?ehJDKGzIrl0eClQbtDKcgGc4zWM7nnfiWjHwty7XHWW+9WCsMqRdAyueK4TY?=
 =?us-ascii?Q?fAaL6YTJZ7AzztV0sC9EdKjqjuBHGhh2oYMrrFzOKyUzA1QSGqJMnTP1tT5G?=
 =?us-ascii?Q?twF56H11b7hO2UIi7ILCdqxPjFtD41VQB5q6BvDTY7exv3McOgTjgnpKX762?=
 =?us-ascii?Q?50yj84mYjDW8gias+jeATdq2UoSKKH5Qw7iEQLnheA2XnucI6g51WUA0QB03?=
 =?us-ascii?Q?gw+w0Ff9hBsSX5gA+eYUtSx7gwVWiyZC8slAQx7CiKYL77CWrbrBW+/F+gWA?=
 =?us-ascii?Q?w8vlrG1FDhKhVFknduyAI4/gcaNfU1pax7UBsMn2IbxE1aMtCA6/?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9025e07c-825a-4ba0-57d8-08def88a6b16
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:31.9532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LlpxTzYgNZG/vLWV+3VmFBgM/xWi1dI3yrjrHtvvdMFiYyGOlkU9WgctKMDnABgZKBHBZ0uoC95K6otEsCDAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

LL fill currently rings the doorbell every time. A running eDMA or HDMA
channel follows entries whose CB matches CCS without another kick. A
channel stopped at a CB mismatch needs one.

Move that decision to dw_edma_core_ch_maybe_doorbell(). It rings only
for a BUSY LL channel with pending entries, no EDMA_REQ_STOP or
EDMA_REQ_PAUSE. The BUSY check prevents EDMA_REQ_STOP completion from
restarting terminated work.

issue_pending() still publishes LL entries only from IDLE. A later patch
allows live appends. Non-LL channels are unchanged.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 3c1f3f728875..5a8407ca68a2 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -167,8 +167,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 
 	desc->done_burst = desc->start_burst;
 	desc->start_burst = i;
-
-	dw_edma_core_ch_doorbell(chan);
 }
 
 static void dw_edma_core_start(struct dw_edma_desc *desc)
@@ -249,6 +247,16 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
 	chan->status = EDMA_ST_IDLE;
 }
 
+/* Must be called with vc.lock held. */
+static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
+{
+	if (chan->non_ll || chan->request != EDMA_REQ_NONE ||
+	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
+		return;
+
+	dw_edma_core_ch_doorbell(chan);
+}
+
 static void dw_edma_device_caps(struct dma_chan *dchan,
 				struct dma_slave_caps *caps)
 {
@@ -374,6 +382,7 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 		chan->status = EDMA_ST_BUSY;
 		if (!dw_edma_start_transfer(chan))
 			chan->status = EDMA_ST_IDLE;
+		dw_edma_core_ch_maybe_doorbell(chan);
 	}
 
 	return err;
@@ -420,6 +429,7 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 	    chan->status == EDMA_ST_IDLE) {
 		chan->status = EDMA_ST_BUSY;
 		dw_edma_start_transfer(chan);
+		dw_edma_core_ch_maybe_doorbell(chan);
 	}
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
@@ -733,6 +743,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 	default:
 		break;
 	}
+	dw_edma_core_ch_maybe_doorbell(chan);
+
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
-- 
2.51.0


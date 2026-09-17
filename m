Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF4A4EB871;
	Thu, 17 Sep 2026 20:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675757; cv=fail; b=c/FRJcW8Uvyzfzsq5eeC1hKtFm4Mi0QiBq8v5Gvikp4pKvyBb1PJvK1RSLQQKVjEHCJsD/5jrTq9wiLHK5qBQo5CT1RwIYiMZhX6ceTjmSuE3mb7KWATJiGjE7RJ56GBZchgfRQdLRjk6SqaWPpsCvXKfTigPPT5KXvmHzEMLZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675757; c=relaxed/simple;
	bh=c3prGjqQNuCb/1WxNIaz/1UjBX7MCJur4Zo7s6bjxCg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OH9A9B7il6+4cQxnc7fdl9zsmZoIR+qlkUSL6BwnFbnD0u3VeaZcnGJ6Y0c3BtgxHbXOMh9YC5FKddXlW3yrsD6zETpo3uIEYE5XJ+l5XNJLPLPhW2xQvOTva4k7p+NbHlx32o11oeBVHrRnkEz90mu7Mjely1h28E131Bwf9mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Nlh10KZe; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Nlh10KZe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+0QdPuWm6WfktcYqcLNUvYkBwAnF3tTq0vj3K6oIHmVbE6y8EFJ7FkdvPNel4c7wr+wP6JLb/E8vfpTg7viGuWt8M6gnrQ8CsEsJYV+qARveDOlYZx/VOHrA/O6NvqjKa6QHXthnW5SHgWsxU71m1Hc7Z7/EM6XE/BEDJl23ljkx4thSYDlStHlIiVySbWzks9NKLlEu2Wd1ujHPs7R5eBBuNcmmCwCRIau0e/W9VYeFniDxB0wWqYfw8RPd+d6cSN560nzWqAiKihUKZjpaj8+YJuMdQIGlZQ4ETex2DE9fSqdGJDDvKw5BExZp/JMhiP30wgeCbuglDBBdIxGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZq8e2eNHOxt5T//o5SZZmn+53Kxm0TAfObkV5rMVEQ=;
 b=pQQ8+zDA+fW7F7M3mev0mJLn28HmdQGf2p7BQNSUegtUXgidkyNwb/+cyE37vW0aIbg7BzyDuX7uG4zyOPf+4grx06459TXokeDqbOi03yd6/b91nWo92jSr2ZfJB9RpB9cF3FTjFLkWofJDKFaDi/p0noHai1FzBEdApvMIyZOXhCne6QTUBtGKLS8VXHqThVikVFs432hEs31CSlvd76GgUQM4KE4LsL/LhActfyUZ3pjv5xoTNq9BcbK4ze6R6H464J+6LxywWB6mlIbsS0MWM3RYJHRq+VnrerzmiLlExsJb7eEOM6+rPvVQMK1vfnqkUWEthLWWdJhZiq0wHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZq8e2eNHOxt5T//o5SZZmn+53Kxm0TAfObkV5rMVEQ=;
 b=Nlh10KZegbVYNiqWZKAOvMcyR/4r3qrlOw0cnr1XHsc4pTK00NBgjjcpkjVawQvLwLktd+vS+RAITNifOseZ2wxXfuHRdMspqBetp3QdPz4KdnVZinarEQXtU/D7Dk5C4f2us0KmaRML1Hk8yhOlq8AeaasyIrIQ41vPOkW7bNd1FM3ib2iJKn7XCUu0G2DUDc/Jc9CGiSNIO1KOSMhpBuuUlYJLfFaNDHbxV1YSWdn+yu3lgTcdTdOReqK4S1gKlhwS33pnA7FciVe5ssC1XWTLLuj0bvI2XAiDUXuc6Jr2zJdowtQZoa2gtEbYD87mrC5Iy/9BaeVtybO5Hmh2zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by PA4PR04MB9709.eurprd04.prod.outlook.com (2603:10a6:102:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 20:09:12 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 20:09:12 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 17 Sep 2026 16:08:43 -0400
Subject: [PATCH 1/2] dmaengine: add dmaengine_prep_slave_sg_context() to
 wrap prep_slave_sg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-dmaengine-prep-slave-sg-v1-1-239c12864143@nxp.com>
References: <20260917-b4-dmaengine-prep-slave-sg-v1-0-239c12864143@nxp.com>
In-Reply-To: <20260917-b4-dmaengine-prep-slave-sg-v1-0-239c12864143@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789675741; l=2006;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=SM+gzVvKuiuPi2Tx1a5Uiy55g4sDIZVRLk9S0eTPuqo=;
 b=nqahrnLPO5pX75Qu71NTzfV0y1SHpFwjskHyhsfDk+Eh8a+626HWInAJEM5QLs9aP1xJGzKjB
 PU5Xv/zK5+TC+FEbcT6w5PkQZq1kBUGO3AI6WCuHQnUapuj0hPysiMa
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR07CA0036.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::9) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|PA4PR04MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: ada7e03d-3c87-4006-e4bb-08df14f78a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|23010399003|366016|1800799024|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jERC4vsAK+/pKT+b7lq9Uiwgk0WM3YLfqAdeS/QtWTuocmyBUd0AZzkvSZk7SGnYtJ+O2UIUWIkVjpeIQkXxHItbLiBvrHZmRYqb4C5M+uXmSs4vRdSHZ7GuWlHW1y8NtR+sznzWnBayo5von2VisFlg+eEd6krrvwBNvvYgE5k/gSgBUVbJUcWguaf4zLJmAmvsAtAPasMG91p7pC0iMgWSbWhfhuGa6Xc1UCQAZ/NwyqTZPLaoJV0/R9MkFW/W5JQFOIvzECFzmTSqPqe3aWYj/xkuXkko2A1sFjt0waUmSmWdLTADJzmflKuz7D6/QxVIla/08oIzJnuDxBdzx7uxOk6ChmLNi+OoGKnVisG8+hPPCwafdg6C1Ty/OK08IwXoQX0NO4UcDgGUCSlsgYG8MEGz/yCnA2t5X+UvH0KGR7u/eZcUjv33dfRTmKs6t49X7omRr9yUMg76q1z+gxFLCqxfhGAEQaeN2FZ0PCVS54zz2CmbWnt99ZOiBlZMOoQCI3F3dA80+FfJSuRACMLyrIAtDo7HdA4VCg9tIqx64rE2W1tTF+mC8WtA+wa0Q0PAaqORbDWmNZfaDCEPRbqnfge+KF03A0n06+y5+8c/xaSup/cODehidaWG15D7BrjMJaaJ1rn9/tGEaorJmoyge+qj07P87kWOUnol8HY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU1udW93YkdFNXl3RUpNRXJvbzg1N3NZUWJaSXJUSWNvZDE4VklsTXE0UnFa?=
 =?utf-8?B?d0FiZlJGbXMyTmpCalc0dDZWMlBQSkpFREpHZ1Q1K2toNG9TdXdOZHJ3ZVkr?=
 =?utf-8?B?Q3k0bVRNTVZFNjBKRTdaR2l6ZlBFbm13em14MjFFQkxtbnI1bnFLc2pWL3ht?=
 =?utf-8?B?QmZvODRIUUxXbzNFbThxOTVtZ2FJN1YzdVRQbWZOZnBPOWZKdXZmZy9GKzMy?=
 =?utf-8?B?RHhseDNmQ0JrZUZTcHhjSWlRSlZLQjhYZUFET1RsQytSVUlyOGh5LzlLSlVK?=
 =?utf-8?B?WmFmRnFrOVpDZk12bVR4eU9oaDh3ak5oSUFydWxHcjAxUGk1UlNwTjRXUGN5?=
 =?utf-8?B?V1pKZ29va2t4UklPVmgrQ2FmR2xxVVVSUFk0aGhsK1Y3Zi9ETmVtVnduSmFV?=
 =?utf-8?B?dmsyOTJieGxMK2xFVGNadHh2MXRvMC9zeW9obUFOQit5RW1oNGo5SFA5SGJC?=
 =?utf-8?B?NGpFWUVvdU5YK0RKM0tSdThEZzVIYzZtL1NGeW5xeml0M2xYSzNPNFVRTElo?=
 =?utf-8?B?cXNvZWlZR0JxQTgzVW9qKzlzUEZHcUU4RC9VOEFuQmVNL3pENW5MZ0VibSt3?=
 =?utf-8?B?OW01enlVd2JyeWZVYkhPc2JVSVdLaGRZV29PZlJKOEhGWUVXME5nSkE1cVd6?=
 =?utf-8?B?MkdzWnRhUXQvRjUxZVF0aGVVbFBjL1FMSkNHSnI0WHY2bU1rb1pFalZSdzlU?=
 =?utf-8?B?aWx1OWdSSDF6akZvYWVpTFpJR3RwckdIb1Fibk4yc0NNRDZJUm1LK2ZpcXMx?=
 =?utf-8?B?SThVTzNzYU1IWVJZc252RFZ4V3JTSkQyaGM2VW0vMHdMMkpOUXVRRlpIbGJH?=
 =?utf-8?B?WkxhdWtCV3g5QXNQNGZVWVNrT1RWaHN2emtvem5VTklZUGt4bE5HSmlmNnhJ?=
 =?utf-8?B?TkEyL3l1NEJ1TGZBOUdRUGVOazQ0cWVjVys2ck1rZkxlRjduWUovRURqSFVV?=
 =?utf-8?B?UDI2T1k3ci9SSHVNUzBEcThWU2VsY3IzYmh3YmRBOXpGeS9KQ0VBTGd0bG5p?=
 =?utf-8?B?ck44WUo5NmtlcThYSDF5Q3VvUlIvWkVZMGVSeExwNVAwZElpdG5Ca21YNkFy?=
 =?utf-8?B?MGVjK1MrNEczSDFnZ3ZBRG1RUTRpeEx5SWFiKzlUdllMRmlsWFBDM2JNRkp2?=
 =?utf-8?B?KzZxT09RQzZ6bEV0UkFoeGdDblFlTjVUT1BnbDZHNnc1ZWh0SHpZV28rbEFO?=
 =?utf-8?B?a0dIaVhaSnBkdkZ2b09MemNJa2w1ak1HL1lwQzR5bzdnQTdQMmltQmlOUlBY?=
 =?utf-8?B?ekMrbEdMK2ZIQlU4UEJ6NFpiTU5nVVd1S1FWSzYwR0dsak51Zy83ak5FT2ZR?=
 =?utf-8?B?RVozbGtyVmhsU3pQU3l4SllDVzRPT1BMdWlSVUthQ3VPcVVxMndDNVZqZmU4?=
 =?utf-8?B?NDZ2cnhGT1N0dlNJbzN1ZlZqK2dacjdhZlhmSGFpTjZ2V2tNY3NKRjAraGMx?=
 =?utf-8?B?OXFQdHJiZHI0UEIyUmxjSXdsRnhLbFpDQ1JQVitBMjM1M096TlB3bEdIRTJ6?=
 =?utf-8?B?K3dKcXhGNlM4ZEVhWGZiQnZIcUo0QmZEUzVwUnpBVlROY3ZtY2FXREJOeHI2?=
 =?utf-8?B?d1d1QVB1cGU4dFdjMFVWV3htbjFGMTNuclVVMUV0L3ZrSE1yZWE1SWM4RnNm?=
 =?utf-8?B?bkdRWFVrekU5cUxDZjk3MnJRcUpRcDdwNUpyUFE1b3N4YVEydng3dkUzK05K?=
 =?utf-8?B?UTRwVG9LU0doMnVPejNNUkRJOU4yU21Xcnlxa0o2cWt2aVd5dkQ2M0QzckVt?=
 =?utf-8?B?RStCcHJjL1lpKzRIMXVkOWhSa1Z6T1NYaDQrSWloVzNsTnh6emczT0dXNzd0?=
 =?utf-8?B?TkZ0eHFIOUEyN1llTlFlTmNDdDRmYUhncG1HUnJUcnJIRE05MWZTV3B3cXdI?=
 =?utf-8?B?Vk9RYzdnYi9vcXcyOEhVU0ZtSUJJZ2Q5RHlKYVlTbDZuKzY3MHBtUk82Ulhz?=
 =?utf-8?B?U1dpdWE5MkVBalFkUU81djFsVkJaT1g0aHF3NHI3NWlqUXZFbWJRT29Eb0lx?=
 =?utf-8?B?SzNNL2VKcTdvbFNRQ1BkcTRpQVlBK3d4NGNRQ2NLdHpDNkFMOUlXdi9SRUZu?=
 =?utf-8?B?VXE2N2lLVjZ5azlWdmRYeGkvL0gxUHdNZzBVK3BNdVpTZU5hZEtkMDlVUGty?=
 =?utf-8?B?U1QwQmQyNzhvSmRveHY0QkRmM2Z4WTNZbHFMejkvZnlXRFRmV3pQVXB1TGFP?=
 =?utf-8?B?aDFPRkRKVWhDVWhVaWF0Nks1eHBEdlROa0VVcEt4eUlIV3hveUxhVVFxdTZ3?=
 =?utf-8?B?dGxZMjAyZ1N1V0MxaUtmOEpzRHdERGZnYXFpV0NLYUlHOU9kWUk2QjRrMXBm?=
 =?utf-8?B?QUR3RGZIWlUvQk0wYUUxRUlIOFQ4bSs0RFdTVjBTdUZvQ29MKzZRYTI2Z1hJ?=
 =?utf-8?Q?rJ/zjzcp0PouM2vnNOVM33fAnmwfJJnCYHTBO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada7e03d-3c87-4006-e4bb-08df14f78a03
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 20:09:12.5280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrrTbAQdVpuIsaoOLUcgH2gLjFxz3vESfzYy32Z2MUu+hBPBqxoSfghU1TMk46WPnEM/cUT1Yzcn2hc7sHYZVX5Elz/Rzkgr3DDt9dNmbRRqaTZ4iscECjrVuCDlVrO+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9709

From: Frank Li <Frank.Li@nxp.com>

Most DMA engine providers and consumers do not use the context argument
of prep_slave_sg().  A few do, however:

Consumers:
  sound/soc/sprd/sprd-pcm-compress.c

Providers:
  drivers/dma/sprd-dma.c - sprd_dma_prep_slave_sg() casts context to
    struct sprd_dma_linklist * to set up a linked list descriptor chain.
  drivers/dma/ti/k3-udma.c - udma_prep_slave_sg() passes context down
    to internal sub-functions for normal, PKTDMA, and BCDMA variants.
  drivers/dma/xilinx/xilinx_dma.c - xilinx_dma_prep_slave_sg() and
    xilinx_mcdma_prep_slave_sg() both cast context to u32 *app_w to
    write APP words into DMA descriptors.

Add dmaengine_prep_slave_sg_context() as a wrapper so consumers do not
need to access the DMA engine callback pointer directly.  This is a
preparatory step toward making DMA engine provider internals private.

Make it as deprecated.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 include/linux/dmaengine.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index c3a49a33307c6..b4589cad6d742 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1084,6 +1084,19 @@ dmaengine_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	return dmaengine_prep_config_sg(chan, sgl, sg_len, dir, flags, NULL);
 }
 
+/* Depercated, don't use it except sound/soc/sprd/ */
+static inline struct dma_async_tx_descriptor *
+dmaengine_prep_slave_sg_context(struct dma_chan *chan, struct scatterlist *sgl,
+				unsigned int sg_len, enum dma_transfer_direction dir,
+				unsigned long flags, void *context)
+{
+	if (!chan->device->device_prep_slave_sg)
+		return NULL;
+
+	return chan->device->device_prep_slave_sg(chan, sgl, sg_len, dir,
+						  flags, context);
+}
+
 /**
  * dmaengine_prep_config_sg_safe - prepare a scatter-gather DMA transfer
  *                                 with atomic slave configuration update

-- 
2.43.0


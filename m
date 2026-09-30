Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095B93CC300;
	Wed, 30 Sep 2026 06:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749745; cv=fail; b=eYnkSeDL94Fyjohw4WcFRQH3JNEoKJdujSYEpZTOh0GK/ADwa9xInY7m+Re6ojxD9AGeJCgLYlnsQIg8hkvmzaXWjOzc/E0t9Slpkb8VaKhgtUTO8ol64h/XpRBd9+hx6cZkpXa7iaaZ8uSimRsPXoZz9ha9zxP2xUxkwYhu2Gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749745; c=relaxed/simple;
	bh=70jh2uz667noWg0UzG1PgF5Kx1ymMpkyFW+EfNnPT8s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=h8ivh0eKjQOBhkTLNoxzp1aTw6hCOcnKZx/ha7NKby5jV/hm5uDq+iEsqbaoKoi37nijW5XbPYq+1afoGr/0XvbUFbpJ9iT+Pcn8jNLuhyhT2fXd1S48b9zFYu0Ho6Vp41HmSLpvQmFbcq9fo6VzilHVrxULShyaGxrFLMB4YsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=THP6yYWc; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="THP6yYWc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2lDWnxKxrM3LTFQ4Z37gzQDCX0QUo4qsrEEgixASqTDNZcPrhjZRJLGRtfsOQ/4WjEEOhq44MMcPBPBIsP4FA6denabS3wzcpDmFCDjz2xFY32jMmUraG4DZXUHsF1mcdaHySfW+zTnQ3dwtomCnZNamm1/010nJ0xjt33M6MrC5yS/SnUqPAhmdQuVVRONSalSjtwm1RCXYDGgiOwQJcG+MgRHu0TFZjzhBoiydCkT58aotH7Th3l8b65dQmKQNfyBfTrppfDExz9LmwzI/NvqL8obIeKCSDKsIdQUk12U5iSj51dRmNDAGQBsnCzSWvPmS5eWr67/cAgkb7M9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUSVm+XkouHlWVUY2eISVk7Avs+rvnZPYeDkeaoXvBs=;
 b=pharfgJbHpATvVL1izi9cZRvYd8ParoreWgHC+OFuRJvQbd+n7F72SPpeJiQn1xcgmAodBnjQdYktVAr2IX1dX5EKxrRXpLkDXxwYO//af7pdq1cB7lS2R3JkMNkXqw+vDMdmwsG/iNt9kRA8a+1IYiPdHzbJT/PB0+tZKI7IEGkclyBmrbESBgBVdQoEzQA7OYAQ3fhWgA75TlRUyYkbMNClSX5RWlO/esC8GvfA63WPXCb/9QgbPK9DwS/PRZPyStvU15sNA/SsCfJP62VoKMiVSRhtjmiQ4e6p4k3axPN+48kO2fuDX0UfRoOHrpYR7Aiu9B3MO7La5PXprtDgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUSVm+XkouHlWVUY2eISVk7Avs+rvnZPYeDkeaoXvBs=;
 b=THP6yYWcxEXzweZuUdnG2ok72fztnwK0XLHr+Bspaqs+hUSnRvNknfcF+UgUo4b5+Jn26bH5eLMEvukJPhLKnpE38Paovn2oqyzsQ67bULhtPpPwVCSRNGHhzDk9c7/hhOrnL+PE4gbyi4UA07lUBRKPaVYaXDHayIE9ati8ZlS3TEEjg+LZXi75dh6PAzR317aZXXyD6bw/fpu35dHRGlnlgaRrTjWyuUl+nkcGduN8AgM4cEAidSQirf2yaRt8EeHNaMqc5miBd41km/BXc1ndw0F+1t9bw0hIuIC+Ag8LZJod0ItVV243eoaSRK7w6PEBRPImYslWQ0Q8GICURg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 06:28:56 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 06:28:56 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 30 Sep 2026 14:26:10 +0800
Subject: [PATCH v2 2/3] dmaengine: fsl-edma: support per-channel DT child
 nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-edma-iommu-v2-2-72a62bf44c74@nxp.com>
References: <20260930-edma-iommu-v2-0-72a62bf44c74@nxp.com>
In-Reply-To: <20260930-edma-iommu-v2-0-72a62bf44c74@nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, Joy Zou <joy.zou@nxp.com>, 
 imx@lists.linux.dev, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU2PR04MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c346e0-0d50-4103-fe08-08df1ebc1aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|23010399003|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bOWJUwg7gKG+n554nUPUs2TsigON89KObPwhnM1MErFJ+jurlwv9n0Z+9sYgLAxJU77n8NyVq5kbBpNO7isBtCQGp1baeKauqcZju951z5UFRfxMWk5xCOPrgCe/qPT+nfBJSRjXaUXxNbG5nwAc8hz7R7yWip2XOebDqwwyshefmMf1vVkfiIm9e+TsR437er8FKfXIo5iXGCRfF0SaZEREE4kXYMt4EnUEfEQyye8vFriTtvdZLuWGXlmrCV8oF/d8eUQZo2e03q/Cmt5mdZmdXff1RHnEiEbI2w40BnhoEJHt2ByS4ji+AZgOOnyq90qC7fep8bmy74Rrq2xQxFnDk0FWt2YwroxlDV1T+Y8f+3pgVP+VrhJ/OG5z8O9HW4XxJdPhMzAY7gY+50zJfNkBAsHhfm7Tbgpyuw+6OODmIXoPephkDTuJ8eD5lFfL006f5a4AAwThGdUu1uvb/jbQWke6NHAe6fpgaQSo/3axABvVWHd/wje268SnVNNH5U6jD5i3cIOaH0jBLsHnqD1Dm51XKh5c3jn7XX4UFshlUtLzswMRDIBe/PPICErcfbJSES3Q4f0rmihI6gub6tYqZcULpS/h3k60DZBDuoNUp9L4LYRw7FTMsaNwbb395cTLr63Ee7akpBsF6NmEtnNMhyMltMwLctGqmDeui/o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmNRM1l0SjE3ZUoxQytkOEpybkxEQkppK0xMTUc4eS9na0pBU2JmS3ZKMkZh?=
 =?utf-8?B?NDdKSTFUb3kzVkpYRDZ5azdaY0R4VEkweUF5M3Fha3JSQ3MvRjF2TWZoeFhs?=
 =?utf-8?B?UXAxVGNFWTUrdUtEVXR2anJ4SGcvdTVUK01RRVFCZHhUbnZLakExdVdGUmx0?=
 =?utf-8?B?bHVyQVpzTHJkYVJ3aVUyUmhTdmFmS0pDbGpodGY4a2x4cm9xenkwL0JDZzI5?=
 =?utf-8?B?VUhkVDlLWk8yUDlWVDVpcVBJRjVvbzdRWDZ2c1BhdlJtbTVPTEhQTlREUnda?=
 =?utf-8?B?dVV4N2hxaFdoaHNqRHVLVk5mZ1dLc3pxVnNWNnJ0ME9kK3RYbTh0YUVqTy9D?=
 =?utf-8?B?dTVRTnI0dExQbDkzdlMreWJLMm9obTlYblpsUWNpMHJOZDdQR3RWRDBveDl4?=
 =?utf-8?B?VlkvejgvZXBJS3VKcFRCR1RRZEJSdEc5VWVXd3lJSFJKWTc1M05oWGVPWXd6?=
 =?utf-8?B?QkhkVFEyNTV4b2x4RGxwdWpCYTdKYjJOdExXVXVEbkNQbnN4blNYcHpTcWlV?=
 =?utf-8?B?eWdQYW9hclZxSWs5QlllTi9zc2dyZlU2RGR1Nk1kNXdhWUhxam5ud2d0STZw?=
 =?utf-8?B?dk5CQ3dlSEY5cm5NZURiMFJRWExvdGo1aEJlalpxOXJvNGVBdUhLTGJOV3J1?=
 =?utf-8?B?TEUrN2o3ejNQc0tnL1NKM0VZS1A3TkJOWHhHaGhUT2JnczJWclhNTG9zaHht?=
 =?utf-8?B?RzVxaTBZbk5RWExpRVRDWlRiamJYQ0Q5bmtoZ1dSWTJtMFBUSzN1SW5rMUlV?=
 =?utf-8?B?OFZ4ZUhxS2Ryb0NCR3NCT2R0SGNjVi9wOXl1NndCVXBwS2VxczZHRHFBdjdw?=
 =?utf-8?B?R2VycUdLUDQ4SEFFMUI0TTZKeEFwYlBIWVJZL2Vnb1F3WlM5aHFIWFJtUVVU?=
 =?utf-8?B?eGpRT2kzM2JlRzhoYll2NUhsMXdobFFHUGVIUy8yalNaajhhZWYwU3JIb0NR?=
 =?utf-8?B?VGtPenpNQWpvd1JISG05Z0o3TFJteThZOFNtek80SmlCSkxnYzFSN0diREVE?=
 =?utf-8?B?SE0rRDFINXovU0I3WUVrZnEwdzlrbjRucUxHeGdNM1NkR2JXU0FpTENPRVVR?=
 =?utf-8?B?YmxjYStQS0RQKzhtbUlqbjEzQml1RjJ2eGY3cTJLSWZnRUxkZVhpNVhqNVFq?=
 =?utf-8?B?UXFvSEFLOXBadVJ6bVMrbmU1bVJDaitlUzdaRzBvQVI3enB0ZUNkSU9mWC9L?=
 =?utf-8?B?ZFRjTUx4Qy9TWEY4TEpRZlAvYmREZ1lyQ2kzRFVRcE1aem41b2lUL1hqclhK?=
 =?utf-8?B?SzRtam5JZjNOaG1nWit3aDNTQTdFUnBXeWZRNTJWSkpuYmVxS0IwK21MMDNH?=
 =?utf-8?B?cUtZTEtrckRrUnlFQnBjV0tnV2h4cU12ZDFudDhndnVtNktsdFpzK2VFdzd2?=
 =?utf-8?B?eFJnMUsyMnF3dFBLVEV5N0RSazFpQnNjOVZWUG44MzltVFFENFJmank4eVJ3?=
 =?utf-8?B?VUdrMFZHZlVvR0pCK1VNZ2MyQ1lGSmN5T3E5RGNBeFRoWmpPRFlIOXVxcDYw?=
 =?utf-8?B?WWVkYllsbVUvQTRYMk9oQjJmZDdkMGJTaEJuTmNhZTZmSEZsSkx5dVhkWE1m?=
 =?utf-8?B?RU9lelZ5bzNNa1BkYy82eWZzUzJnNnVGMW9jK0tnWUl3NUJ1R3YrUU5TKzJ4?=
 =?utf-8?B?c2IyQXBsZklsa0g1VVF5dXhwVFlvRENWeUEzSFRaVzBWdjIwVkg1ZlhQYWJV?=
 =?utf-8?B?Z3orR1M2dDBpNVo5RTRIQ1NCWVdVU3FnZTdEM1hRWXhtYWNjOVJ2ZHJrTzlR?=
 =?utf-8?B?RUo4VjE4R3hES0Z1NXhad1VlL2JmY1Q2QWhYV1VHdFpobm9PT0NlZ2hvT3Bp?=
 =?utf-8?B?eW9kRUt6ckZ4TGNZYUdrSWJncWxsOU4rRkdsUzBLdHBpQlpzL0k4QUdRTjU5?=
 =?utf-8?B?R1lSdXREQ0YrRUJRdE1neEFlSlR3WnJVREtLMUJUdExBNnRJWU5PdEdHVDU2?=
 =?utf-8?B?OVlxdXRjM3pIWkU4dmlKbkl3M0hGWS9wZ2ExYzUyaUh4Q2YyR1hIMWcrSC9G?=
 =?utf-8?B?WTVvb1dxTTQvQUQ4Wm5ybnNXZitJUkt0RTROY1NwbENteWw4RmxFVUs0U1l6?=
 =?utf-8?B?MkJlZXNiODBNUUtkdFJsdkhuVEFJSXcrYW5EMlpuYm45MWx5QUtkUWEzY1or?=
 =?utf-8?B?WDFaR3BiVzZrSGlJNG1wb05ZblhTd3ZUZ1VqZXBkaGtDeC9LT0RaTWJMTGl6?=
 =?utf-8?B?dXBGUWtxdm9HV1RWdnpRNkRSVHBTcTMvL0UxVGtWWEFYOFFya1NTb1V2ekY1?=
 =?utf-8?B?cWsxWklKaEw0S2FPLzN1TjM0b25aQ0lRK2htaGlUcjdMVXdSUVFtWk9jeVZz?=
 =?utf-8?B?dVpjMCtETEE3dzNySUgzWWQ5VjdjMExlQ2NrRFIzMDVzbGlhckNXMlc4Z1oy?=
 =?utf-8?Q?EKl95WWSCxWiE2z8mBHCXX6KaODEhhaxXhpOm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c346e0-0d50-4103-fe08-08df1ebc1aee
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 06:28:56.7318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0BxGHQVVFjwZsk3Wi2ZV9LLimGJV+j0Nn4Md2xk3UwTfiGRaJ2AASxzhFsSShUX3uoLbpXeQYzKUsTgG+GSYu+420kFBP5ZHEhoeVlKIwEW/SVj1Ozr9c5o+8+J8McJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9081

From: Peng Fan <peng.fan@nxp.com>

Add support for parsing per-channel child nodes from devicetree.
Each child node can carry its own interrupts, iommus, and
power-domains properties.

The implementation is split into three functions:

- fsl_edma_child_to_chan_id(): derives the channel index from the
  child MMIO address relative to the parent base.

- fsl_edma_configure_chan_from_dt(): called before setup_irq() to
  populate per-channel txirq from child interrupt properties.
  fsl_edma3_irq_init() is updated to skip platform_get_irq() for
  channels that already have an IRQ assigned from their child node.

- fsl_edma_configure_chan_iommu(): called after
  dmaenginem_async_device_register() to configure per-channel IOMMU
  by calling of_dma_configure() on each dma_chan_dev and setting
  chan_dma_dev so dmaengine_get_dma_device() returns the per-channel
  device.

Existing DTS without child nodes continues to work unchanged.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/dma/fsl-edma-common.c |  10 +--
 drivers/dma/fsl-edma-main.c   | 149 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 149 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index bb7531c456df..8c78b0d781b0 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -283,10 +283,10 @@ int fsl_edma_resume(struct dma_chan *chan)
 
 static void fsl_edma_unprep_slave_dma(struct fsl_edma_chan *fsl_chan)
 {
+	struct device *dev = dmaengine_get_dma_device(&fsl_chan->vchan.chan);
+
 	if (fsl_chan->dma_dir != DMA_NONE)
-		dma_unmap_resource(fsl_chan->vchan.chan.device->dev,
-				   fsl_chan->dma_dev_addr,
-				   fsl_chan->dma_dev_size,
+		dma_unmap_resource(dev, fsl_chan->dma_dev_addr, fsl_chan->dma_dev_size,
 				   fsl_chan->dma_dir, 0);
 	fsl_chan->dma_dir = DMA_NONE;
 }
@@ -294,7 +294,7 @@ static void fsl_edma_unprep_slave_dma(struct fsl_edma_chan *fsl_chan)
 static bool fsl_edma_prep_slave_dma(struct fsl_edma_chan *fsl_chan,
 				    enum dma_transfer_direction dir)
 {
-	struct device *dev = fsl_chan->vchan.chan.device->dev;
+	struct device *dev = dmaengine_get_dma_device(&fsl_chan->vchan.chan);
 	enum dma_data_direction dma_dir;
 	phys_addr_t addr = 0;
 	u32 size = 0;
@@ -847,7 +847,7 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
 	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_CHCLK)
 		clk_prepare_enable(fsl_chan->clk);
 
-	fsl_chan->tcd_pool = dma_pool_create("tcd_pool", chan->device->dev,
+	fsl_chan->tcd_pool = dma_pool_create("tcd_pool", dmaengine_get_dma_device(chan),
 				fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_TCD64 ?
 				sizeof(struct fsl_edma_hw_tcd64) : sizeof(struct fsl_edma_hw_tcd),
 				32, 0);
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 6934ac882697..13bc5059d1bc 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -16,7 +16,10 @@
 #include <linux/interrupt.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/of_dma.h>
+#include <linux/of_irq.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
@@ -395,12 +398,13 @@ static int fsl_edma3_irq_init(struct platform_device *pdev, struct fsl_edma_engi
 		if (fsl_edma->chan_masked & BIT(i))
 			continue;
 
-		/* request channel irq */
-		fsl_chan->txirq = platform_get_irq(pdev, i);
-		if (fsl_chan->txirq < 0)
-			return  -EINVAL;
+		if (fsl_chan->txirq <= 0) {
+			fsl_chan->txirq = platform_get_irq(pdev, i);
+			if (fsl_chan->txirq < 0)
+				return  -EINVAL;
 
-		fsl_chan->irq_handler = fsl_edma3_tx_handler;
+			fsl_chan->irq_handler = fsl_edma3_tx_handler;
+		}
 
 		if (!(fsl_edma->drvdata->flags & FSL_EDMA_DRV_ERRIRQ_SHARE)) {
 			fsl_chan->errirq = fsl_chan->txirq;
@@ -698,6 +702,133 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
 	return -EINVAL;
 }
 
+static int fsl_edma_child_to_chan_id(struct platform_device *pdev,
+				     struct fsl_edma_engine *fsl_edma,
+				     struct device_node *child,
+				     struct resource *parent_res)
+{
+	const struct fsl_edma_drvdata *drvdata = fsl_edma->drvdata;
+	struct resource child_res;
+	u32 ch_id;
+	int ret;
+
+	ret = of_address_to_resource(child, 0, &child_res);
+	if (ret)
+		return ret;
+
+	if (child_res.start < parent_res->start + drvdata->chreg_off)
+		return -EINVAL;
+
+	ch_id = (child_res.start - parent_res->start - drvdata->chreg_off)
+		/ drvdata->chreg_space_sz;
+
+	if (ch_id >= fsl_edma->n_chans)
+		return -EINVAL;
+
+	return ch_id;
+}
+
+static int fsl_edma_configure_chan_from_dt(struct platform_device *pdev,
+					   struct fsl_edma_engine *fsl_edma)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct resource parent_res;
+	struct device_node *child;
+	int ret;
+
+	ret = of_address_to_resource(np, 0, &parent_res);
+	if (ret)
+		return ret;
+
+	for_each_available_child_of_node(np, child) {
+		struct fsl_edma_chan *fsl_chan;
+		int ch_id, irq;
+
+		ch_id = fsl_edma_child_to_chan_id(pdev, fsl_edma, child,
+						  &parent_res);
+		if (ch_id < 0) {
+			dev_err(&pdev->dev, "invalid channel in %pOFn\n", child);
+			of_node_put(child);
+			return -EINVAL;
+		}
+
+		if (fsl_edma->chan_masked & BIT(ch_id))
+			continue;
+
+		fsl_chan = &fsl_edma->chans[ch_id];
+
+		irq = of_irq_get(child, 0);
+		if (irq > 0) {
+			fsl_chan->txirq = irq;
+			fsl_chan->irq_handler = fsl_edma3_tx_handler;
+		}
+	}
+
+	return 0;
+}
+
+static int fsl_edma_configure_chan_iommu(struct platform_device *pdev,
+					struct fsl_edma_engine *fsl_edma)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct resource parent_res;
+	struct device_node *child;
+	struct dma_chan *chan;
+	int ret;
+
+	ret = of_address_to_resource(np, 0, &parent_res);
+	if (ret)
+		return ret;
+
+	for_each_available_child_of_node(np, child) {
+		struct fsl_edma_chan *fsl_chan;
+		int ch_id;
+
+		if (!of_property_present(child, "iommus"))
+			continue;
+
+		ch_id = fsl_edma_child_to_chan_id(pdev, fsl_edma, child,
+						  &parent_res);
+		if (ch_id < 0)
+			continue;
+
+		if (fsl_edma->chan_masked & BIT(ch_id))
+			continue;
+
+		fsl_chan = &fsl_edma->chans[ch_id];
+
+		list_for_each_entry(chan, &fsl_edma->dma_dev.channels,
+				    device_node) {
+			struct device *chdev;
+
+			if (to_fsl_edma_chan(chan) != fsl_chan)
+				continue;
+
+			chdev = dmaengine_chan_dev(chan);
+			chdev->bus = pdev->dev.bus;
+			if (fsl_edma->drvdata->flags & FSL_EDMA_DRV_TCD64)
+				dma_coerce_mask_and_coherent(chdev,
+					DMA_BIT_MASK(64));
+			else
+				dma_coerce_mask_and_coherent(chdev,
+					DMA_BIT_MASK(32));
+			ret = of_dma_configure(chdev, child, true);
+			if (ret) {
+				dev_err(&pdev->dev,
+					"IOMMU config failed for channel %d: %d\n",
+					ch_id, ret);
+				of_node_put(child);
+				return ret;
+			}
+
+			chan->chan_dev->chan_dma_dev = true;
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static int fsl_edma_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -831,6 +962,10 @@ static int fsl_edma_probe(struct platform_device *pdev)
 			clk_disable_unprepare(fsl_chan->clk);
 	}
 
+	ret = fsl_edma_configure_chan_from_dt(pdev, fsl_edma);
+	if (ret)
+		return ret;
+
 	ret = fsl_edma->drvdata->setup_irq(pdev, fsl_edma);
 	if (ret)
 		return ret;
@@ -885,6 +1020,10 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Can't register Freescale eDMA engine.\n");
 
+	ret = fsl_edma_configure_chan_iommu(pdev, fsl_edma);
+	if (ret)
+		return ret;
+
 	ret = devm_of_dma_controller_register(&pdev->dev, np,
 			drvdata->dmamuxs ? fsl_edma_xlate : fsl_edma3_xlate,
 			fsl_edma);

-- 
2.51.0


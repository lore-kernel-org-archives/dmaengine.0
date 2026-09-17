Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58173E0082;
	Thu, 17 Sep 2026 20:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675772; cv=fail; b=VVQlmOMELXJQq0NvWLUZU+MTqhiUTqqUTHpIODyrLtuZiLdgWp1+pcAm+tluUWlu8f3E0Q6NmsTpgKfMDC2tWJUD9zsVI6Qgqd/qZDOR9eT6+0+VW9gILzYABw00xo7B8M+5wM+2VpKUSomDUnqOXwGE8pI1iU7Kyh8SRjzawH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675772; c=relaxed/simple;
	bh=7+1jGNcnjElR6VCV61IcmmJuJZz6/9KuJolfmyOrbsc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=A5a9DYpM4KuW0AztCym953gCID0LQGHUov9htTZdEMCWSX1XKuUOTokNhKLn7KABwYs6aE9L4QFLqOkSt4DNHbCjKDCF5SfTvIVx/ZwnoAViWZ7Np4h2xgvGIAru2ECRsDSocdnzo7m3vWBEWX2++QIUOxYGrVYYzShXU9dr8jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KZFx4Czp; arc=fail smtp.client-ip=40.107.130.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KZFx4Czp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZATmNoKz2DI1+aijT0D1b8o66nYcI0pPmHiI2JOajkDdkEcas+PRqp9HJ173yIQl5UOLlJPvkbwjj9pXwJWDU5SEMYJn97QqOymg+DurrsklRH/2LHlFkDH8k0GJORuOR/j4FqQhGFYer2VVadOOJTzfxXpusirLkYOzA0DDTwbobXgiGAQGrqJ6XjjNbAt44BeD/eIpgrlB+PJUZ7F6xF/juSf0VN9U+ZzkfICL5JSmig74BGdb6yem9t7UWFenZExnLxF6ibtl+qLlaJeikmE+aL1b+CATKS5LqaxX7sqlMEYKCR/iSVCzVOCU7i6Slb+c7B61AyHpixzGdGnbOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2g2BLNjZLS2tUh0mBpZfziTCB444M8Vw+dJ8cpShoe4=;
 b=xv8us3tpLDsGJZb6ECJreV35h8Ky3i4PG1c+7NsFar2y+68w5DwDTTEsFWGgbvsW2/v+gGg6HXMPpxHrwjthE5QqO9XcXfFGz9TWpV56kbCwFLszjxznUebyBZMcCDRx2LT649p4hrivAQ4s8RU+arxjNXAvsf2YEZbkADXUfofrcr/zJ47hwLEfYodAXBzgP3sdw6UpKGh7kD8GYOaB6bWuhKh0bBzdNGK2joo0ail853z4N5SsGbjuLSv2B26lwcGe5kxQG53/8H2Csuznp41tUvGNnIng/lCgwzhvO4xl81QxlIjeI8n9eXDk3P099s+yIy97K8fT9GVaMsMP0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2g2BLNjZLS2tUh0mBpZfziTCB444M8Vw+dJ8cpShoe4=;
 b=KZFx4CzpvhInZMN64Vg5gzvqUsZuEasN13n3Cb1/JL4QiUtmztLsEBzsoK2S7Fe4AiXnPJjywxSHu4nmZj4OEj6Cp9w9GFoHOdb8Aq2FYOZAOSt0cx9Gh1AjkDbX7Khszd9mqGMMfA/sRNnK4y7WcDHdS0Ah4pSWi1jKB9US4KWLqtX6ajqD17Bg/R4d+vtBIuz9tTBBS1iJdaku9KZx5olAGSwHR82l0cYV3BEu8dJwTr+Uhuhdk8pItj3RC29rpr6IiaNAnlqvHEFCP674eLv5uasTloKUgvESaLURn8E8R3Saak1cZvAK/e8JMr2UjfR6+9TiHPdFwzRmjSp1fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by PA4PR04MB9709.eurprd04.prod.outlook.com (2603:10a6:102:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 20:09:18 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 20:09:18 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 17 Sep 2026 16:08:44 -0400
Subject: [PATCH 2/2] ASoC: sprd: replace direct ->device_prep*() calls with
 standard DMA engine API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-dmaengine-prep-slave-sg-v1-2-239c12864143@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789675741; l=1862;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=bxzgGLe5soMgQpm1K/XpJNUpsViHqXjVJqz6EyRo5l0=;
 b=jkw5eEioIVlKn3x67FnTxzvjAxxdwT+ciJIHLg47rwfRsfFYaGY+jSLccCJHcUEJubNM2onZK
 dBGe7XVvm8RC4mEGzRUB7sC3rG13B3Lno640jdYgiEz2iC1yOyBUXDR
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR22CA0004.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|PA4PR04MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: c0435cb7-6596-402b-2596-08df14f78dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|23010399003|366016|1800799024|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5pqQIqRgctwzkVhQGKgMlOIelPmeQn6PvXcUMnt4pZP0XrWkcIFK+GQ3vnV+UPtuCzA1M/O419jbMSgJG2addc6L10PvGaQ3jq2LJneEvZlPAzz8jYMpaiur8Jr+FzGlv2YhoVBQYe5hXMt0GJDOen9Sxze16Ts3rDoRuU+voQ78W9IxPs/6+SRdVkEYe6+/zY2NOkR+IIcXbfYpOypfniiIcG42hV3TlVMGxffw6rdaFe0e+c/6O5QMWcI9pFS7MqFe6692xdqYwBNSL003obWu40ujIPLkPkkG/yP1WZjaJi3yp0Y7ZbVTQF0O1KhKKdcnAHbXzw4M3RtOR6g8GV6umUYbPtanGG1vYpm5U/KPASWV9whykI6lsWcX7lQnHaHXdlv8irj+RP7MNcWcrE7dtsXbyJGztCDc8pLL3ybmM6Oef5HvPIhSG/MvSigmy/McjHGn0utba3/OPRQ59zww0OjRjpMBknjHuxH3JNrsyKNFHn0zGnpbJGcUjBIOMiFrqZYYPftk7Ss1VlS/pxPGiz2nRulkIinO9K+G2mhvO545a1LrZOyWPQiCwGN2fsEcXkag+Przdw6cYhHSWvUGNNO26n1bTfP+r1Eih7BfDRaiq0l/ulxwEoTZlZH6nVmdJGkmDA2hNs9eqzCaMuf50CHCEUp5exMj0GUw9xQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGpDaG15VFZkRFp1RU5ZbFExaGtOK0p3U3VkZllZMGM3OEtYbXZRQ3EzS2F5?=
 =?utf-8?B?Zk12UXR4ZzYvNEFtZnhvb3h2a3VWS2FwbTRTRHBqTHh4TVQ3R3VyZU1NRTB4?=
 =?utf-8?B?TG5KV3kwc01BVkNNZzVvY29XSG5JSHJUeXltTWdmNkw1SWtVNUhDOSt3d3hi?=
 =?utf-8?B?NkZGdDBLeDB4UmI0TjlEQlNacTZNaEdPOEN3aVhXanIxblNjQjRpZVpiMHow?=
 =?utf-8?B?WjIwNnYxMkV5b1FkTkFsZVhDZHd4VUJHbmE2QzV3TWEyY1ROOU9jbHZjUzFl?=
 =?utf-8?B?V0s3RmlBb1NzbVlmTWsyQTdTL1R5OWlqTW5GUDJ2cXZwbDZJNUcxWTJMUGQx?=
 =?utf-8?B?ZmI3Rys1VS8wVElmY2loYTZKWmVGdGlmM3NzVjdjVFFNYVJrK0JpT0VSTjdz?=
 =?utf-8?B?VFRsVHpiM2ZiTXFoazJWWjkwMVVhNWl5azNBUUJ6WC81dTREZ2s3MkhxWFBo?=
 =?utf-8?B?NVIxL09UUndLWnFndnU4WW1yc1dVV3hJVWhFNFB0dGNySGdLQ0RyS3ZvdTVl?=
 =?utf-8?B?cFlxK1o5R1RMYWtyK2RNV1d2OCsvM3NqWFFVelB3R2ZXUjRNdEhmTVhpZVNE?=
 =?utf-8?B?RFpzbzlydEp6UW1uTE9TYWJYUWlQMHhTRUgrbUxSWjJzNnI3UnpEemo1RlBh?=
 =?utf-8?B?SDk0WmtxVWVIY0oyNFBFWUkxNHpIU092K0YrYmdCVmlZQ1VuYWRjMHY0d0xD?=
 =?utf-8?B?dzdURUlJOXJsSCszaHY0ZDg2RVgvNVNyY3JyQ3AySHp6cytweVFCUXo0Yjg0?=
 =?utf-8?B?Y0plSFRCT1ZTSDJ1MnRuVDZOZTRYWnNMU1VJSytGVE5VQ1duV3ZRTEpNQnVk?=
 =?utf-8?B?dVFRanpNUkFwM1p5NUxRd200TzF1dHZLZnYreXYxR3NGRTIzUEVwMm9XWXlj?=
 =?utf-8?B?Zk1UbG04RlAyTVRTeUJNRFVPK0lzYjVBRkF0ZFJmZTF5aWlnS25HTEIyWldC?=
 =?utf-8?B?WHJialJFSklRaWtRVVMycnVQVWE1YjZ4YlFSM2pqdGh1TnF1OG80S2tTZUpo?=
 =?utf-8?B?MDJ6d0xua2l6RVRWQkU0MXc0WHFhaTVDajEzZUhrTDhuUENNa1ppKzFzNDJD?=
 =?utf-8?B?Y3lDWjBqcWI0d205VlRVMFkrbEordHAvT3VaWWZPWjliTUVzZS8wZ0ZJd1lS?=
 =?utf-8?B?dmpzK1g4VmtKR3hvT21pSjJydmFzcFNrRlBIMWlYTmwrb2JpTC9CWUFSRHYw?=
 =?utf-8?B?VDdUR2hqY3pva0RtSERqZUkrdnF5b0lYRUVHSDFacnFjTHErM1Q2d2FEN0Rm?=
 =?utf-8?B?MXFmdkpiK2NRZ2NHbWE2MVF3ODh5NlZxbFdkeHovUC9ZVXVUUUxSRjhjRVZC?=
 =?utf-8?B?OGZPOHRLOUVtYzZ3TFNKSnkzYi81QllyQXQwR2tNemN5M2thaUo1ejRhdWxk?=
 =?utf-8?B?bkNWRldjOXpQYnJJV1VDbGE3dkNlK1grMXlyUVVxVnVzSi9neXFXQnExQVFZ?=
 =?utf-8?B?Q0JnWS9LU1IzdWljbGZ0ZDYrOGN4UnFZRHMxa1hDWlY4MGFOWm9nUCtkWlFM?=
 =?utf-8?B?aGFRRDlYTVJoYUg1YVA3L2RRUnU3VFJGenBuOExyekxGeHZYNnRUVitmbUZE?=
 =?utf-8?B?MlNMdUhPVVF6d28zZFJPcm8wWEtnRlBmUC8rY3JiZyswME52MFVzdUd3VWhM?=
 =?utf-8?B?U3lqQ3hhd01GYWlKQkh1bnRQMlJaYkFad203MHd5eWJac2JkQjlqUkxKZDZi?=
 =?utf-8?B?ZGE1d0lFNXVlc2QwVUlFa3hBRE1vWHlqRlJsZDB1RVJPWEtGc3hRQ2h1OGQw?=
 =?utf-8?B?eXFIYXJlZ1lCSmJCK0FCdEpNRHc4Q2M2Yk1tU3pxbkR2bUs2UTdhdUpkQTRw?=
 =?utf-8?B?MktEcTZ4ZTJDN0lmMnNzZUt5QmdHQ3hHMXFkOWthZnBPV0tTTVc4N3c4cE5Z?=
 =?utf-8?B?ODR0Q3dzN0Ftc29PaVIxZE1DQTUyUmdJMEdHYjFyVnJBdVd3R1ZjRXBrUFZj?=
 =?utf-8?B?SDVpZWsxY2hBMTRPWWM0ZWsrbVpvZmdkNi9xcjFuTXR1M3hERG40RWFMZzNG?=
 =?utf-8?B?MGwwUXhpcWFDYjJKcDc0SzE5NklxRDRNRDlJRm9NL0pjUEZmTHE4YlR3UWFL?=
 =?utf-8?B?bVBXd0h5UWZwa3cxRy9aT2FNWGFTTkpMeDhRbXRrZDZzVXBNaVhOVWlXNmoy?=
 =?utf-8?B?ZjhuUWUzeHBWdGljWTFLLythRWFGdVdEK0FseU5lWHlHd1hDMFQzL1EwZE0z?=
 =?utf-8?B?ZVZlUHhwSVVneG5DSDhadDRaNmFNYk5YaGRBR2JBeEFORXlZdGM0eDRRZ21U?=
 =?utf-8?B?OE1NdDQ1SHU0MC9TeHBiNG9KRFpqMjIxOXFCVTJyM3N6OW5SSVY4eklXamdv?=
 =?utf-8?B?QXlHVnhQTHJTdmM5R2RhQkQvUjlnOXoxV2FOdFhpaThiREpiaXhOTk95Mjh3?=
 =?utf-8?Q?wkj6pawEoR+VNLFsaKWFzQ9oxCAEKzRO1vPk9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0435cb7-6596-402b-2596-08df14f78dc9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 20:09:18.4049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QMGyGDocXp+rQbwyVpzCv43HEa074yCX7v4XfiB3e8z0hwzegisATQwzppHK0hgRdD5p/8+ssI9JBRegGMz/O0W1eITZ30aZGPxLlsoeZUscP4GSajFXSyFLU1clazW2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9709

From: Frank Li <Frank.Li@nxp.com>

DMA engine consumers must not call the channel's device_prep_*() function
pointers directly. Use the standard dmaengine wrapper APIs instead.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 sound/soc/sprd/sprd-pcm-compress.c | 6 +++---
 sound/soc/sprd/sprd-pcm-dma.c      | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm-compress.c
index e5249924b54d9..649e59462935d 100644
--- a/sound/soc/sprd/sprd-pcm-compress.c
+++ b/sound/soc/sprd/sprd-pcm-compress.c
@@ -235,9 +235,9 @@ static int sprd_platform_compr_dma_config(struct snd_soc_component *component,
 	 * We configure the DMA request mode, interrupt mode, channel
 	 * mode and channel trigger mode by the flags.
 	 */
-	dma->desc = dma->chan->device->device_prep_slave_sg(dma->chan, sg,
-							    sg_num, dir,
-							    flags, &link);
+	dma->desc = dmaengine_prep_slave_sg_context(dma->chan, sg,
+						    sg_num, dir,
+						    flags, &link);
 	if (!dma->desc) {
 		dev_err(dev, "failed to prepare slave sg\n");
 		ret = -ENOMEM;
diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index 2d5ffbe17e814..d31afbebfbd0e 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -276,9 +276,9 @@ static int sprd_pcm_hw_params(struct snd_soc_component *component,
 		 */
 		flags = SPRD_DMA_FLAGS(SPRD_DMA_CHN_MODE_NONE, SPRD_DMA_NO_TRG,
 				       SPRD_DMA_FRAG_REQ, SPRD_DMA_TRANS_INT);
-		data->desc = chan->device->device_prep_slave_sg(chan, sg,
-								sg_num, dir,
-								flags, &link);
+		data->desc = dmaengine_prep_slave_sg_context(chan, sg,
+							     sg_num, dir,
+							     flags, &link);
 		if (!data->desc) {
 			dev_err(component->dev, "failed to prepare slave sg\n");
 			ret = -ENOMEM;

-- 
2.43.0


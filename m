Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7DC43A807;
	Fri,  2 Oct 2026 19:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970867; cv=fail; b=iWXUn//EaQ8WdJpgpPfyJiuX8YlE7vRWltfrKosYcfsBgI+RF3W7x+X0PJQYdI9cI/Bcjh2MMtXNmp5HjU72X9HoLuhViARlPDZM8+kzNoICrRukM/CcIcxlmsNBPiZziCQ/xtcz1gLefPkNl4LOoEqRPwelF2bWo4NEQmwzLmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970867; c=relaxed/simple;
	bh=WcPY8HcMeVWsLBll+W3RLn4i5o2ZiV/VCxa2xGnz6mk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=or68xn/nOd4G8wTPj9toBo6tObjvTsQ2u7XLPb6MS4/KmLvnL1AujMoIohR9Hd0OJ3d3ocdF9n5sIF+Jj0vRGsowPDaRmw1Xe3U8Gp13LYbJpY2QGXMCTa90MPRueolBbFwE1Rh+wv/pWItJzpfC0kHwSPcJiptK+yXGB/mNQjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pciV7NTq; arc=fail smtp.client-ip=52.101.69.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pciV7NTq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAzdRM8uEiTxQ+4+gwESknQSdmOiXHgghNf6G6MoiMOqn2OR2gSFjkwbkFcC+KxLYV/mApjnXB0GGC05lGtNaHGzEWt+0/8xoTQphbzn6MG29v/2zm7Ew+CbjVHzmwDhhagLaTxJUnb7iHTydGXOHKR+ILM4UxPo5zhTa7V6WrRjeP20wF8y2UCc82X86HxEXWMcmSR7lTOAav/WAqBn0oZvRkllmjuJb+wedNkzFGSFUCnnmB3CeSFCefqFZHtE773ptCmoMeiYSc3db60+yp22lhpykwgiNnCF/NdVeTEcKKWfJamXEfPTv9Yz1rAR3bbIp0hU9LCh2YnmSS//eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWacEahaOCXWuSubgX+M48+N8lNN6j6X+1P8hu+l2f8=;
 b=wVOnsut8f/BPGkUyX62JeERvuZkOY0T1KRn5n9ta+Sb9bwKj8Lb/DtiNNk3kvpOvSJVaG9HAHV7I0vTz+4dhvPN2eq7Vp/Dsjd52E7u9muk5H/IyOmy3drMY9PwLg1q9keUdTEnBYocBTbvMZqjv8SYGhbS3EjEYU3NCRmBnyB3Glg1NJu+xOmfN/wejPWRS8Y+A/HDyt1bcvFAKDOxCBOhntFAj4GAkfMHWCAqzMk0qGles+1GdeEFOExrxNpQXWgHc8LvabyyH894nSQA3Ic1da7erovivYBWLAzIgNn92THv5rUGHFXZtQpFxJMexONg94jzX7D5wTvfEi2+FTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWacEahaOCXWuSubgX+M48+N8lNN6j6X+1P8hu+l2f8=;
 b=pciV7NTqDj6IBnfKAbm6bvhJb9k4wEaKO9gHA4rMHVmZBTg2OR2oMpxOZh3eY6EZ/zkeWGv45wzqejb+tVR6Gqy/xRK8kj6wocT9lAn6TD5cCkJahFPkMTumN1daLxx/NBnHgI6mbneFKqUSQ8ol1M82xicXsF1KVBjEPDdeAf58xyt7EaSg6rZ16qNSX7xHBlvAYvkma8mMnKsmr80na8VxS75qrwouoQcAOKMLq/dzmR6gfPtFdKBWvMCJhN8sohqeIslvZ1rzumzpg2T/Jxa72ZoUvk7iWIVWzEtNZooe3jlv07oIgjI/haGBZMjFb8u8DmsISbrGEujnNHDLnw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by AM0PR04MB12124.eurprd04.prod.outlook.com (2603:10a6:20b:744::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 19:54:22 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%4]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 19:54:22 +0000
From: Frank.Li@oss.nxp.com
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] dmaengine: add dmaengine_desc_set_callback() helper
Date: Fri,  2 Oct 2026 15:54:09 -0400
Message-ID: <20261002195410.213610-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR14CA0009.namprd14.prod.outlook.com
 (2603:10b6:930:8f::29) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|AM0PR04MB12124:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d5afaa-7286-4a79-cea2-08df20bef43a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|6133799003|18002099003|10067099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	C4RvRu5+cs8uuk2hlyY492el+vgEsGpYn5yghD/t4SAXBUm8DbYvNkjiUNr2+IpbfbzD4HSU/8LikmUne8po8w8vzai6pgtqsP6f4/3iFmyk3EblF0ThpMBCO6zzA4kfKupuhZudMuGPhl9/GaLVmmshCrsOlHwdrAkH60jJoER4ntKwxczXP4iI7oD4N2Z8v5PiO2VAMNSWbieatXVL5DcVIaUIDy5xr9UFG4g8l5c/c4a48EBR6gH3boAzRs4qyrBPF/XE2u+eOwdHJW2AEXstm8IvSTje+jf4EtmDfYSJ8KYzT3rdzsreqH8Lflkgv/7ib5QCOM94hZ1l42OeCiXvbdo5v6rLypUTuG4M2xGaRdBI29dfYo52GC8HrCb0se20UvYRFPDZhWS39XKrfSR1d9xtDau4q/uFAVcUFt3VsWLf4wR/onpZVhans5SRuiIWceavOMFT3lN6tpBLET0wKjnNf0NQFkO30jyiLpvTzV2xMmsflKlgqBliCKdnJ1LApgmGE/WTM636pIrcGqSDQqOJLyoza3cWK2Sss1E3+saQPTIcJzzAhFR5ksd5dxY+Na7bCJ9H/CXm8m7Zw7Sb+UcD1zEIXdlE3Py+jzjJMdq++5MMQgi/WkQZ62coYAi54CHbZBJ5WpU3ac7maGL+flyWG72ggMxqwzvQHDU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(6133799003)(18002099003)(10067099003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fHdN5b6xyebu6AAyTx2+agh334psWLR4IANeGsIm9ldQ/xcNUNIyJ0qWicFs?=
 =?us-ascii?Q?6tLFDfW59H6AztFn1UrL2UdIbIpjlhYjYPoqnxL9y1q5nCk8QynOehsv+uFt?=
 =?us-ascii?Q?LZHemKgBtLj2ukk+LskaWbkgGO3RGcCuJ+MCeB75tEDn0+ODRHmL/fpMRFY4?=
 =?us-ascii?Q?Lrc21sbS7PxAuYZRQfL+288gU73mMi1aN7KNlTGx2GXhYfUq3yaxjj//2Te/?=
 =?us-ascii?Q?FwujqcaR4svVxmzpUap9i+rTHLXs6n92t4ntPZb7Fao9ErbHWSvDxOYCVcoa?=
 =?us-ascii?Q?WvfFwZ6BoELiAAPwJDpJwAF/+R5CZ9l4u9YRJ1OzyAbba6uNkeOggQj98JAo?=
 =?us-ascii?Q?3AIdHYoZDIeZjAgVeDsw/dLHm4iXJB8NCqAd/1Wgup6WHVzlfZof+4yXIajR?=
 =?us-ascii?Q?/akivqKinNBMjI1Cr6rlfOINH3RdNgzvhovhpNnJvYuC+aD2s0LHqD2eYmkM?=
 =?us-ascii?Q?W5Dnyak23zbjTTr1sNceZiGNI+qLXzJ071LG5PgB2hR7ZNE06rxH020w4fEJ?=
 =?us-ascii?Q?/ae6ZfGXTQCih97Zn3Kd2UblbSQiOrpfqOhXJql5kvPJHvctIjkwuG8CR+F/?=
 =?us-ascii?Q?MSeTxLwwYWdWPHzMCuCV0Uqg4U1g2dxA3uZuj9o4itOwGi8IvgXDcBxDuImW?=
 =?us-ascii?Q?eNpnsnDtdu5jYKGeCLCZJb+WKfyxeFAa6LQhs/9J9qsA8S7BZcI87YFbbGuT?=
 =?us-ascii?Q?AyIhY0DmvdTL9SLAMrnHWQ4+dGD8seaKwE//UHpTp7BzCWWJ6qyq4nr7k0T+?=
 =?us-ascii?Q?VVsrg3kFf8ubmAXTiBQ6c386JXHNctWbPahIRowx739c9iQ4phXl/GoOSarG?=
 =?us-ascii?Q?z3c28ffvkKy5BCl57H1DLmHgWxampMeL0qEu+JErHMesfP2D+OseOwmFUoy3?=
 =?us-ascii?Q?fy0k2U972yzB5xGCOUoW9zjnZEeBrXq2gvhw7GGS4fSZfqYWa8mucvm25k4+?=
 =?us-ascii?Q?5IYbsTnPjoB5vVs1fAUgplD9sK2Qwwf7iZ7HI5MfyeDu4ZXIj5yRand2Hoe9?=
 =?us-ascii?Q?mcm8Tyi4+VNw8SqzHTdc1Jur3OrsG6nnkKgSl1WaGoa5ARamb2zvHIu+1jyP?=
 =?us-ascii?Q?SsWpqUNHiW+lesaw5k7IFBOQvJCdk3ep3eMvmSW1egTMP2xybei73rxO2cZ1?=
 =?us-ascii?Q?NwC2jwm/X4W5Y/KqLYDMcxpodz8sJ8b8GlAljwn8J62DXmj8O/gypBIl4W1x?=
 =?us-ascii?Q?h1mz7+pIuXLar1Qz0onovI2N86NUC6qPfXY0KlbSKZocVGFItzx03U5K+VDK?=
 =?us-ascii?Q?DjpEnzBJaNFKp2f+wzgIArLzpEHIjMKgNIkqoDrF8MDFnQfWpfpng31jfThY?=
 =?us-ascii?Q?j9dsFnVQeae4nChfokBZHHQ/QmgQ8lwANmvteBYWGhqVbsnsJUMCe/YEylUo?=
 =?us-ascii?Q?psC2kjYzmuRu74y3yjBcugooqDXXXO6xxWIO5pvy1weBn99zl8zRMcBhMlb2?=
 =?us-ascii?Q?9L6rxz3Ys/yfaY7q6XC6zbRi6nlmxR3PT11NrPas8Z1ySuu2XFyzSt8gCkVH?=
 =?us-ascii?Q?MfDgLmTao5dKrcIqfd6KYXABv/cMSHydquoGr1NT3/vlkFkpUALOZ+aMOM9c?=
 =?us-ascii?Q?HGXLgizUJV7D1Ut6AtMUP0+w6gnYsoFUQX0dKLekW1wat9aErTJ+xW+0Ork5?=
 =?us-ascii?Q?jZfBwE9UWzpqnPnel+Lv3cFre6uh/cRCb4xGs6VeUaqH5d70sWMKuOi6idcv?=
 =?us-ascii?Q?ojhd2Gk/0Fn020yTUBhaJogHInS+v2AaUaHs8WrE5Tb3KaCAUyW+2fJaMmJx?=
 =?us-ascii?Q?62AsuSFODt5RkC+ulluTXjmNAAM5ApJKb7cEwm+lc25VS2IgeTIA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d5afaa-7286-4a79-cea2-08df20bef43a
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 19:54:22.4581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGalZTzNbevj9TOxnafjhHTejlqhBIjQTXoB8iD1bp1Zo8TjX8BsR9qeRF0Kl9UIHh4141jL5/GdOSu3RqyLpj0isYGbdaf1m68QWci3lymKSFzAPbpKxdATWVk6dYRw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12124

From: Frank Li <Frank.Li@nxp.com>

Add a dmaengine_desc_set_callback() inline helper that sets the
callback, callback_result, and callback_param fields of a
dma_async_tx_descriptor together in a single call.

Using this helper instead of open-coding the three field assignments
ensures all three related fields are always updated consistently and
makes call sites more readable.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
dma_async_tx_descriptor other fields have API for DMA engine consumer.
Only missed these callbacks.

After all drivers switch to APIs, dma_async_tx_descriptor can be hidden
for provider only.
---
 include/linux/dmaengine.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 1b57bc4a7e72a..63d99e1ea2dd8 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1754,6 +1754,31 @@ static inline int dmaengine_desc_free(struct dma_async_tx_descriptor *desc)
 	return desc->desc_free(desc);
 }
 
+/**
+ * dmaengine_desc_set_callback - set the callback, callback_result and
+ *                               parameter on a descriptor
+ * @tx: the descriptor to set the callback on
+ * @cb: the plain completion callback, or NULL
+ * @cb_result: the result-bearing completion callback, or NULL
+ * @cb_param: the parameter to pass to the callback
+ *
+ * Sets the completion callbacks and their shared parameter on a DMA
+ * transaction descriptor. Use this helper instead of assigning the fields
+ * directly to ensure all three related fields are updated consistently.
+ * Only one of @cb and @cb_result should be non-NULL; if both are provided
+ * @cb_result takes precedence in drivers that support it.
+ */
+static inline void
+dmaengine_desc_set_callback(struct dma_async_tx_descriptor *tx,
+			    dma_async_tx_callback cb,
+			    dma_async_tx_callback_result cb_result,
+			    void *cb_param)
+{
+	tx->callback = cb;
+	tx->callback_result = cb_result;
+	tx->callback_param = cb_param;
+}
+
 /* --- DMA device --- */
 
 int dma_async_device_register(struct dma_device *device);
-- 
2.43.0


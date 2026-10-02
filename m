Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011062.outbound.protection.outlook.com [52.101.65.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FADC3DCD96;
	Fri,  2 Oct 2026 20:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790972638; cv=fail; b=Dn6fPv3sXCF9Guef8y7AdgZWSg6Ugnn4o/TcrDzKTBN8owvpSi4FOO20pRBdAXlKXcomSWhv64nkXl7BvfqJ28kcj8FIymp//Yz5lIbxK1/iwFH9VjaC/eo86RDN84QZsJnoOSp97E7BSAbS9dAxzfF5O/sQNwFvAFBU9bvIrCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790972638; c=relaxed/simple;
	bh=iVsgB66x4F8D6SuthgTVfjs8kJmAaF1l0gdomCQItrY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=blb8CMPo9UP11Yu21M0pSXEhnGIjzAvkz0JZwMfBBWxUrWosD+vX1B5GyFCSQXpknKPVQ6/2kw2QcxAPnKhfizbD5BY0vl4/+KGbZ98pHmv4J//YCxejGCoOiHOuhRIp+0JNFtqp5S0ByKFspcccGds78UQuTiURDShWqR8corI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ab+ja65L; arc=fail smtp.client-ip=52.101.65.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ab+ja65L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWariJ6KagbObsIdPCb38La5DeXy3hc5sSYOqVo5M13FITcPDDxdelyo75iBSXl9qQPXIHpvEa7oYFFXtR1wZd7ejlawdFO/lqUACGK7YCsIcgOAFVgf/5qH0fzIoZKuNCxUwSIzNpf9ZszjtjuX/4hobb5u0k/hHfyd4SEzGhYNvUf2IjvnToo0mX7WQA5LcHaJ+ONOYkxK6f03zhlqQOAsrn7z/1JEgDROLfA7lfVWmPo43GyBBqNfX6/H4bqClK9krKYgRHWSWC7DgkmM6MbNw9KPnfWmwLWbuzZOWYyraob2hlg0TAqbIzpcmjks2nYXE44m0okR2bpVqOscRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAhiViDwHamiGq2jNIxXx3DOSAvrBj71wopMP9CIaCU=;
 b=UZDEAj1davi6S575ESSrEML4JwAZb/Bwxv40fWqgG90Xm0RLCSbQdXTsNEAJ1uSv9xIx6CRIk6C0wQx7mmO77K84JZQzfnz0jgjFvZ0m0OGigpvAnnytQMOp8NQk7cmQiDxuzvP2DUAgtIR32QWoVcTi20Ctd7+h5NmyjGX3R+EuYd0uhNNtXYZJG7v4btMwi16Yz43GYiBv4IN7m6Y/Tac1H2wDeUqdasyL2zc3jFfRL4Pbt3G2ivgREF84JTmFNu3MsVG/gT71iQtZpxjZEZt+TaIU685p236KexNWjdaxx5YsoQKAZQkxNx/1YB01XPRzuxQH5UU0pNy+gMCOyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAhiViDwHamiGq2jNIxXx3DOSAvrBj71wopMP9CIaCU=;
 b=Ab+ja65L94c1axADCexOfVeVtGjx7i3s+JW5L0FLsetrdWoTpmGSWSfQettuoJfkaPGafXqPprq44RO/Cm3uJVRpVTU9TzVsyK3/eU9kjaG0np6GAOgz/yf4aIa5TY9opnovvH6fGYOKAlkJeLBcorsmlDN9e16h07KKx8HxVhykhE6u73fHuI/EBJzea3bPtTjxbjYp/Hx+g1tyYuwIh8FSbFBubizCnu2oV9CXHCfAY/ElmZR1tQigVZEK/3X/XMoX4F5Qu0RioM1QRpdcuffKsvTpKJzB9tkpDFbEaqqv5kZMnTuEMBgRYxzHOzr6rG8G9YFERzehjPH/F6iOQQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB12214.eurprd04.prod.outlook.com (2603:10a6:150:336::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 20:23:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 20:23:51 +0000
From: Frank.Li@oss.nxp.com
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] dmaengine: add dmaengine_get_provider_device() API
Date: Fri,  2 Oct 2026 16:23:40 -0400
Message-ID: <20261002202341.253152-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8PR12CA0072.namprd12.prod.outlook.com
 (2603:10b6:930:4c::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB12214:EE_
X-MS-Office365-Filtering-Correlation-Id: 68322d0f-0e97-4fba-d2df-08df20c312ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|6133799003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	zNpIqfvDwf+SjcdQklwcKAHS8zA1wUEBCsycIQ85ghnEC2QmOIV7nu4BMzD9rYX/qJPOXhHUiUHmU8BRJimTozmchsGLhwzXTYXCySIrm1Ubc6VKkgTOYouYrPyhblUa9TU9eTe/FoE5PKtqbL8VctXFLXTOTLXnWEotrDy0KpQJE+Jyt1JXWcT5pxlfqa6zpmdRlLL41ccdxTcXzT83i7/cc5W5+RJhCa6+l5YCsrMv9Vfudm1qBpcYPWcZmwJmq+btPm+sWXp0GjqNkcpSquEAZzh/W7hUlGqAiJt4JyOTLNuHINM5fHK1xwHVD0yLpqe1SdMSd2jlhcTXI1GwRnVAwlUi24oMg49sHbZM7k5uWnIq89akvQf6VBnZNR2W9sEmWkcS3v5qd4Uf7oXTTOUm7HHks8S7WJ7sxve1zA8be6qupIBMUQVt2Pv/Ccum1kjZwtWG7DjKd7W0aegKCgRASqR2+TRmTp2nFu3XlG8P092Y1JuJ6oz7fBF9qZ1iATMDzLkMb2BtCbxLXPHd69Cg30HA4UNAJMtBnYuj5LjF0DRDTjbKEAWBJIGXxyUivC90y6Y/3p3Mn5QvRot4W/1yICCSOctd34eMikbSXd/IyTuHAPmujDq9mLJgE0yxV9XPPTD6QRabz1VvedHuEEjO73hsJEP8YtyhgbdE+48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(6133799003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2d+MQqXMQ0HX6AislgfBDyqwiCu8+7lKpLWQiHdgqeUH04s1UIaB44oOSfhw?=
 =?us-ascii?Q?g48u7i+fLRcR90A7IO7VjpXhgKPLynxC3UqB64LgzI/gkKVjeEkdLw1UEbW4?=
 =?us-ascii?Q?jbe+kGgkFFme2vNTe63KfItBsPTZjHNyZ6s3+YYTLZXsH9t5G9v81STKVkvz?=
 =?us-ascii?Q?kEX99+iN2ZBwPjgKeh79Cy77mtApdk+jugOn75QtpqpkIbPh1dmgRnFLFnQC?=
 =?us-ascii?Q?eWKJtVFNQR2YICA8MfWsGbkJoiUEN1eZKFVQ54KJzXXWqyrgX7VZ10yy7FJQ?=
 =?us-ascii?Q?zmhp/POGywXUzEcg3WnD8tieac5kwAwZG0Jdja+j4GFJXJkPBP9bm6JCXpep?=
 =?us-ascii?Q?Mf2VwBvP/yAOJGkhTaw65NCPp5Jh6rOSl9vg20oszYXOMimxn1rPFUrmfAI7?=
 =?us-ascii?Q?BedG9Uj+GxOsFqF9dBALW102pQbQtqUgnYpvxOs+16Xj9UTx+fGwlTzYqJ5d?=
 =?us-ascii?Q?hTwo+OjPl0g0KUc/JiE14Zerhkw0+n+SLggCwMZfAXLkTd/XyvxNtLb2EYo/?=
 =?us-ascii?Q?HVTMaHQuPCcGpOonCYiAspR22hZ4TwCEbYeLB8PMSsLa6f0xYOuL+FU99SQ4?=
 =?us-ascii?Q?UpbzbTnBpwk5iLmmK7C3WKaNe/OVaUR9x5xVR38RNgum7wVDppjul1z09DBt?=
 =?us-ascii?Q?5G5B+OUqgrVZCgq9P1PbopA18bzoo+eLYONPwDK6zPsLCrL5bC31tQfDiCu9?=
 =?us-ascii?Q?xyi3f+kIEbcHbBHMobs96wkwvBV0eWMvwcGxsXck/nKSOOyduUkgufC8qPgf?=
 =?us-ascii?Q?g8sqi+dzcJD50qk7rPyR/HgT3Az54X0o+axGYgF71e0PGk8+WBH8KRs6/VtN?=
 =?us-ascii?Q?uEG3ZsMPPt5dldQH58WHEum81uit7aTFOvddxkVKuLZbBEyRsn6JeNEDfyCk?=
 =?us-ascii?Q?zj51w1uF3FDpt0653ExrVF8UT+lPdRpUxJmEuwlqS9/zIqmXXYyQYPLgFIjw?=
 =?us-ascii?Q?aE87aowVkiZNYu5x57W5kq6M2wuOF1DxnwFsgERDVAjwMtQ5WY9Czo0xa/wa?=
 =?us-ascii?Q?lj0Npr9fMBgV4amAb/LIIhdgj7vbDVWAOilsE0EBEsrUjc/iohWIqKv+7gyc?=
 =?us-ascii?Q?QiANdeD7FfKSaEHiBtdGmeR7+SOtULMKCWc0pFUuqey+Wlnkl0+1L0eCkMeN?=
 =?us-ascii?Q?Izxgf2dmHf8D9CeYMQHiRHkGZ+VssvHb7/s9UqeDTn4DilbLBOlORH0Ji+Gl?=
 =?us-ascii?Q?V1bV+l/77ZAx6c8YZT6EPDpUCRy9i1Xk2py1Bu+oBhCCfhfldYDO7KVxhx8d?=
 =?us-ascii?Q?tYmNaKUTdK7GNMueP8QrhM7WW9TDiJS2RD+8Zf9gE04KA68JnRE5I+EZS1gP?=
 =?us-ascii?Q?BIUXPz/rtViX0afaATH+OaMPaKCBRopuJ6DU8iFzeR5OjZ63jJpjA2QcKHYK?=
 =?us-ascii?Q?PURlzlwVdW7qW1YuhpmPL4969idgOzJA32xL+LVCE70o2IbJt4/PVQm3nN6Z?=
 =?us-ascii?Q?DXgwg41iilZJFlOyYNkSldl3M1E0MwyXbbCGGUBn9Bb4VwyzZNwyK0ETs4Gd?=
 =?us-ascii?Q?16miwr1ta/WwF2PBC0a/J7OD9jWsKgrt5L8cbrTuWJ2D7lrgRN3UY1p7NLO2?=
 =?us-ascii?Q?Bl/CdFYlIringWU1lvkpfm1nICcdAZclbpiKGR9L45KD1DlZem52FCQFcYkM?=
 =?us-ascii?Q?jf8LfUZINhKQwdl3rercfSh4Rwp5MQ4rhnmfDl+mLWqFdyaKSoqorCMcj4CC?=
 =?us-ascii?Q?2RkaYnKZItxf/8ppqCtQgVvfDDqfkX2dz5fDlHIp88KaGSXEsP0KN/seb6y1?=
 =?us-ascii?Q?GalxN4gQt1Mi8Jqs3qhififPQoPojIfvmWMvxzYgogGbTNVAoRDW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68322d0f-0e97-4fba-d2df-08df20c312ba
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 20:23:51.7944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNu7GzNuC4LhtxU//t/FIcpGxtFQqsMm+gBOZH0Zu4kRhuXQWc6XQcsA6Z9oZdvsMBTZbiyK3Bx+XnenaSIP6l5N8DMDv0YnUCVL+YOb/Vn44hLNA48NZzucPTgAzCYy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12214

From: Frank Li <Frank.Li@nxp.com>

Add dmaengine_get_provider_device() API and kernel doc for
dmaengine_get_dma_device() to describe the difference.

dmaengine_get_dma_device() is used for DMA mapping because some DMA
engines provide per-channel iommu mapping.

dmaengine_get_provider_device() is used to find a DMA engine channel
by a filter function.

In most cases they return the same value, but they have different
semantic meanings.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Prepare make dma_device private after all driver change to use new
APIs.
---
 include/linux/dma/imx-dma.h |  6 ++++--
 include/linux/dmaengine.h   | 21 ++++++++++++++++++++-
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/include/linux/dma/imx-dma.h b/include/linux/dma/imx-dma.h
index 16e491f63883c..7c678316b7578 100644
--- a/include/linux/dma/imx-dma.h
+++ b/include/linux/dma/imx-dma.h
@@ -59,8 +59,10 @@ struct imx_dma_data {
 
 static inline int imx_dma_is_general_purpose(struct dma_chan *chan)
 {
-	return !strcmp(chan->device->dev->driver->name, "imx-sdma") ||
-		!strcmp(chan->device->dev->driver->name, "imx-dma");
+	struct device *dev = dmaengine_get_provider_device(chan);
+
+	return !strcmp(dev->driver->name, "imx-sdma") ||
+		!strcmp(dev->driver->name, "imx-dma");
 }
 
 /**
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 1b57bc4a7e72a..f9918a42473f5 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1807,12 +1807,31 @@ static inline struct device *dmaengine_chan_dev(struct dma_chan *chan)
 	return &chan->chan_dev->device;
 }
 
+/*
+ * dmaengine_get_provider_device() - Get DMA engine provider device. Typical
+ *				     use is to find a DMA channel by filter.
+ * @chan: DMA channel
+ *
+ * Return: Pointer to the DMA engine provider device.
+ */
+static inline struct device *dmaengine_get_provider_device(struct dma_chan *chan)
+{
+	return chan->device->dev;
+}
+
+/*
+ * dmaengine_get_dma_device() - Get DMA device used for DMA mapping. Some
+ *				DMA engines provide per-channel iommu mapping.
+ * @chan: DMA channel
+ *
+ * Return: Pointer to the device used for DMA mapping.
+ */
 static inline struct device *dmaengine_get_dma_device(struct dma_chan *chan)
 {
 	if (chan->chan_dev->chan_dma_dev)
 		return dmaengine_chan_dev(chan);
 
-	return chan->device->dev;
+	return dmaengine_get_provider_device(chan);
 }
 
 #endif /* DMAENGINE_H */
-- 
2.43.0


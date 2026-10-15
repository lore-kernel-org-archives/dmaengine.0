Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011049.outbound.protection.outlook.com [52.101.70.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD803C4B79;
	Thu, 15 Oct 2026 15:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079804; cv=fail; b=DSSDxGhwrH+Qz8PDcn6jbLrh7+XhVu2cLTgkssYhHyC0UDjpWr8GPMEfX+oO55gaFs2PhnNSJUazBOPr7aG0VU3UO65w+XpdSCtjxJysYtIP3hBdYGqFn2m8mYqCiZjziDoMsk9Q9XCspan+oFUsRr8ScaGMhyGM+MFE6hv+Dcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079804; c=relaxed/simple;
	bh=HidCZMX3OGHzaATKCU6p3JdFpG4OKteB/e4QVOgwXns=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XQYHD8oGKbs6bjQH6sWuuCtXZXD9EtrU6iUoLmCORRlH8hi7igKCUiopkW4QPLnmp+TwHJzfISEMwoZ8+TQlBCJQ7z6HQr57EtwatrFvsprkY2htBqz17Kok/4YUe83TIkZtE3BAZgAJDvdhaEet7o7T35XfwJIlFC7NS8fSGpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=b2RZ988q; arc=fail smtp.client-ip=52.101.70.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="b2RZ988q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quulgFABB6t2akmLvTCsVmItGyVRQdoY/Z2TG4t9mKQkNtwOP17I5czgrdhyCvIBQ7p+iUVN4wUApBqg7rysrYJKO57rw4U58H9KN/B+c7nvkZqlEoRpX2T5ME5v19VQustaR+AZzYhvsxR15vsiYhj293u6ghjnnwvyztoKgR08878hBJe6kaWoXt5TwjIBb7lHvMTrD/+elfk8FEUNdcSgV3kkq+U/xjzCyfBDtDgadSsBUlDFOVocLdt6BKxqJygkO27nDO6wyOAbn+AzUaRElauwIDoaprec7fUx7xi/b44KYJWCw1CFA5+4dKHT/gamPpktHrc5pzpVYFWBzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnl1jNJA399D/8IOhVP+kGy4nwuRI/u9I0Krmk72sao=;
 b=ZR+cE8SZ8MRuaUlg/cIGAOWhxBL7RtrMXmmloXkF6Xhl03H3Af6ZlNP+PIQBVTd/CDwSB17nCF3Br7lCxPBe8vjGRqipGvOLTeZSgwfNtCf8sajUTO3vSP+cWB3vgT8xyMmqI1NaHMvbcq6tfGjkH+31RKEHJZ3h1R+Gt32L8iH84FHa7JDi8x1d4YptF0BSvWw8TDAHqIsMcGn3cQj7fzGnGx3brj7cjG9yrhxa6MP4S63ZQ13gGlKZr6ZnPczTrXOwk3oAzINVibFrQCV5vaDGJo1JxpNY/DY2/2xHmZGxmOJVPNg/HJissHGXZiv9QSgvwfHw6c3VWAnNrfYcFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnl1jNJA399D/8IOhVP+kGy4nwuRI/u9I0Krmk72sao=;
 b=b2RZ988qkDFNss0TCerm7nVVNGfxlhQygcQC/cHkkkdvmfmrPICj9r3NHip9ZeHIlmB3dZ4TZnVk4sEHLjlcnxUNviWO560r9DTkxuM72PiEElja5TcTdsdhhRNbTy/qkAC3z9Mdn8gwdbkRGNzhu3kpk3z4+wCwmnyEWZmZb7UDoK3HQ8jG+goAcfm/X90TTbPWGe8tjTzIkUwo32ZnnW0mzHmLClsh0qB3A4w/6tHraHG+Cit18KAFULxabbCjNzTDkqeehq/ki1pZj0xQm1wv4rbrNzRjbVTGunXFiQ17h5N65+eh0LmILPZDHCvrmwQBUzh3AQu3tMLHJiTW/w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMDPR04MB11652.eurprd04.prod.outlook.com (2603:10a6:20b:718::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 15:56:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 15:56:29 +0000
From: Frank.Li@oss.nxp.com
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/1] dmaengine: ppc4xx: adma: remove unused async_tx.h include
Date: Thu, 15 Oct 2026 11:56:14 -0400
Message-ID: <20261015155616.3068503-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:930:4b::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMDPR04MB11652:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac8def0-a4a8-490f-b499-08df2ad4e052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|19092799006|56012099006|11063799006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Ol1FM+l7T9pynVN5p9F9wR+dRWRq8NBrK2qX/xzn11eafDoy45Uh3AtBbDcP11q6zuOxhB8uKlPGIHb1Rgi9hjWs39r2rrOTU716RzJQ2fPuHlhsf206LXoeI6BXa8VvqieE9DMDVVZ9T3l56Q7ZCe4RWJb6rMRj6ghd2ke1ls/0/MXc4ka+oBR+s2WqVpoC/8EjIBgHP9gM7iIAMZ2pzqeuOEw7wtVLXqDTyD4a7xQe8wsb6nTz0G2eFKP3uaM5CeMg0kRgr6+UE+PpPvMznN4CVXX/1YsAqqlxvJaFabkmXwOwCPa+0cH8c4NHK0gFKkqRbguw62E2u0T1ouRTzEFIenOD9lJTHrUMYEmyRxF5JmF0JOAbmoz+IfWc+pnz0BQ1GfCBdP6sQivl94XFImxYFXIZCu7Ne6YTmHKIPkIjhnpKgTaQU0aR2tH/MfnD3f2SMq1eopJuB4j1zmU7+IgnVFXR8GJkiYejmGV3bEk8nVnbVePj4JanZ1kYzNWT8voNRGLNoxqw6QJ6K8R8aoOIRmSw4KTQMFo0xg2p+Y9tiDgHuG1W7qS2FLQs9pBGhTiEl4+nvxlkDxwlkv+2S/XX4Yp92Eu3kHKZ/HRpQS33292fqjAmtGiTKwXvON4pesKHrQ7nWOZrOMaU35Fxh2RgVpFtgfLjK+Xj9fqfmtY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(19092799006)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BXzX8+Jzem3+KFfo+RuUi1EwAlfRIffTugiiU5IsvHghdBpPVXVcKRMLyjdL?=
 =?us-ascii?Q?kaFrF0NMe7LqJNrHuGGjg5wKplu3vVzzl3gunXtuAkbzGhIRkaU4ApEQ4O+I?=
 =?us-ascii?Q?lYXdU3J666soNlWBcMGiXVZpTmbLZwtCqaCgA6Fh1upPDllFSBSLXfolntkC?=
 =?us-ascii?Q?2gnz9yi40Z2zRNueoU+f59MFy1eAWufZmp7m0puCBZaaOi1X+tAhSwNFIXcg?=
 =?us-ascii?Q?kGPFOWLNSOB37ph9p2kxW2t11Ng5swdb7VsdUGaHwVF/so6tI0FOwNqihLID?=
 =?us-ascii?Q?SPegRGm6nDYFDgnOv/SjB3bibEhMFXhuM6/7lGzogKuJJzryUX3PKXc0I3oE?=
 =?us-ascii?Q?s3IsFv7HZ7lDv/pxAZv29ME3L7c1fvTRm01nKWbOzxuRP5erhAk0ucrGx9PY?=
 =?us-ascii?Q?QypRCFA5yG9pZz59L5Tio/NDEIMygr0Ob54nr7l1Zo6Erx8nyxRDuB4i9bg/?=
 =?us-ascii?Q?unkJCMWkMhlikfU5sVsABBLeUj9chQQz4UkWpPeiMFHEn/OzOJreQCv34iZl?=
 =?us-ascii?Q?221Mp1ni0qgq6DwU3mm66tbG+PJIr5zVvJZSvay4xK+Jv5XYRckj4oiAyKJ0?=
 =?us-ascii?Q?xMeVlkrUJK+jqQxmGbncOBkQ4/xghVqve/Yt0qi9drYTs7aE+dNOFwi+wGm8?=
 =?us-ascii?Q?GEjltpKhInoYNJIS0FhVZ4DFnTRXyCaTAISEYy4ZNNwhozW7ulN0LAa6lAZH?=
 =?us-ascii?Q?+s5XNts/PnPfTp3DwCTf+xSP5jL4X+Sa5pQeay4KOBwHT+35vE3OupjNoIP/?=
 =?us-ascii?Q?Mrt3xTUpTR1LYBzrZCb5FR4iKu21x9tjRjR99Uo19YtNyHHe+t8brBXv+LXM?=
 =?us-ascii?Q?5ixF72is0DbJXnvE0K9BPH7r3Hy9R+CdsPpVRSubpUkwA+ImcBAinXsZge8g?=
 =?us-ascii?Q?awUtV9M26L55wf9LzEemN9nG5e0Tn5C97C9JoQm9bwtKlq3qzS/feaM6wcCy?=
 =?us-ascii?Q?x02yi3vG3jBDXR9z0HZzRdkbGMg5GpIeu6kY2Pw51fQgbz6i5ikY5c9gInik?=
 =?us-ascii?Q?baBv+CFP66A6Zin8qBz2bYILczJXRR3GJHzzaSXwe+A1lSAFljcLVKlz0Taz?=
 =?us-ascii?Q?8GKj3x+fbL/37w3ZcOGRHGIv/tPUBcMyXgLhV5oSdSLiPw9QJILXsjPLEbr3?=
 =?us-ascii?Q?EW5ks5YL+H82J3dDoxrofmaCHDzJbfRHnJHdf8yiBDbp+iyjsfC9SjN7H1yq?=
 =?us-ascii?Q?eyvdnCkOewk/aiwG6HUcjyltDTWlz9Osk5CSuH0lYA8eh5k3NhAOwfziTtjp?=
 =?us-ascii?Q?GB/CLE7kPKRE/Fy531orTFqQtcd6qYzgdUP9/ACurul0ExiQwGCVlO+zb5dn?=
 =?us-ascii?Q?RBnZQ+5E7HU3dkM47BHYtFv7jqP8uNexw3daMh5BnVAEBxlNFIvxL6/QwvtP?=
 =?us-ascii?Q?StOefVXszYs20c09Y70N21/2z83L/81ol6O6a4gJuE/lLsEHrilr25J7odFA?=
 =?us-ascii?Q?av2RnPBz/OmvxVjJMT27cz7b/n1Cq1Ddalh+DIZT+bgCEThPbJG2+Y0BFT9G?=
 =?us-ascii?Q?aUCIXrfVexsEzXe6US6qB56mXv3YzczUEYDyP6Cf45S5FLIdNUNWeL2s9JPJ?=
 =?us-ascii?Q?mgUumYykU/zK2p9AUOiNk17GfknzeBwBSqNkNRu1+GQzPlG74LUyBmIjOsNu?=
 =?us-ascii?Q?iaBJTvBnKoI9rR/qCWEFz9ZLuB10pFyMnODjhwUQCZ52kBjUCGBy7khEFu5W?=
 =?us-ascii?Q?aqYILRuprTQTZCS1GX+DbfRizPE5+XbGHSwfRbarYItXx8mW8BE9c5lifRHw?=
 =?us-ascii?Q?Sxd/FVOqpCt4QKlauyEuuf/CElM0HgnU9aYMHskY3u8TRBvVEy1E?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac8def0-a4a8-490f-b499-08df2ad4e052
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 15:56:29.6491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sI+UYQM2/K8FLhypjdsNpfVpyGt6DhhiVSQXTTuy7u1Z7eFjY05FBObS/iv/Bk6igqXtrZHDtbh9pmTion3LjcB0CpG2SW3HMCHA7RgUskV2nKQuWT7b/C+lrIx3vCbb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11652

From: Frank Li <Frank.Li@nxp.com>

The async_tx.h header is not directly used in adma.c; all required
types and functions come from dmaengine.h which is already included.
Remove the redundant include.

Reduce async_tx.h user to prepare deprecate aysnc_tx framework.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
v2: change subject tags to dmaengine
---
 drivers/dma/ppc4xx/adma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index bcc54d584e2bf..05041b99581a1 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -17,7 +17,6 @@
 
 #include <linux/init.h>
 #include <linux/module.h>
-#include <linux/async_tx.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/spinlock.h>
-- 
2.43.0


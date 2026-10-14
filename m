Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013069.outbound.protection.outlook.com [52.101.83.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BAA3BFE4F;
	Wed, 14 Oct 2026 20:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008753; cv=fail; b=tvZGR/tZyOnDeAnaLCa4Il4Gr1z5/tykM5EOnlZLtbgamLN98VjwOQQgam3oRDtEWoWINDHBt7UZe8Bj8afPHcSQHq4ld2Bao/eOsCQQLOpQBAtXygOckn5W/cN2UslDNRSmCGEC7QiAIrMxgf1wqMIKkopLWdWfV5Y8eJsh0d4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008753; c=relaxed/simple;
	bh=tu2yaq15Mn/QhPYXZ5Ta9oW4FKjD2tfdMZSWyhzmPCI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KLfDtXautoSAF3VCHotK4xWaoSKy7tWBZuolEAH4w7Sez7LXrysM9XRCLcGMKAP6GEPL0+wvo7ZhdjLzrWjjoVtIwM1Z417T+qkFlI+JCPwm4oGzzCqc1zwUpujxFKMXqsmhQ+BhqPvWrVBcxCm5gxtDztdkCU9WISY/um5qtQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VpvDz1Rc; arc=fail smtp.client-ip=52.101.83.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VpvDz1Rc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJUhCdsDULhLH8R7mTI0nJkheXY0rZ1WRsC6D0a/mrWyz1YpDsT5wh5p5dLRC7YgHsOmU6xGc2meCAWk50MK4CgA98aA/6iw0Dh25rv6SQdDYcOjjsrkRDs9bwSTyhdZuVqp8Fjr0A4nHE3yL52NG47CPElprSTxQRl2AmeHNG1ubfiA+G8gJm6JX7uQRSV3Pub28UCLdZDJakpyW5irhEoRqtZJvHj9bZwiVZ7myhVXTX8JPukXlGz36TuF7eUFXm1SqoUZyVm+sC2jbt64jFmahS9K74JQZ+6Xdqiao9g8QLct/Er8HVuqPyFJUuWi44aGzYzSQ1HDyjetHE7hSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qeJhVfFBMkZ7QFGIG+qubDKegY38eDZfEU99dOD/Dc=;
 b=oI3UwRGOhEDtQGj11nbP6+0NU08sxHOAirilOpQIgiShC92EhaNrpi/9Mcsax0fZ9TOxYwoUlO916hUomwdNReLrapV3yEeOnaqcHegS07u60HP0a2cSKYuMaABRYdw/g2+nWa1McZfYliArg2VvKjzzF6WivHJuOGom84JeUB/sbfGrasohaYDPQemrm/uL3SR1/pKo2UznBW0ZC0kc8IP92Q3rsns7b9q7hfOM8r0H80RYESZ5xejlQRDN/zKQsm9YGq9fdcv9Q9GKOqB2Mpi8RKT9rYpJKFCW1ICb5bJGvoFwp8x8Z3gF41W7X4bwOC2bFyhbOv4Mib7tjwrj8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qeJhVfFBMkZ7QFGIG+qubDKegY38eDZfEU99dOD/Dc=;
 b=VpvDz1RcBOz8dTj8gs1iD9K8GBAZxKAzutP6vznaBvC3o52Ey1QXkx8Vaapu3Vj9HfC3TzWmaJyQ2XiDF+X44w9lNmg5ViYWXHq+aMcjqnf1U5vLeRt5GHKqnzb57n3FA7ZTBc1QpG1mh8pqoQwy/78BsYlpHYQl2UQYpB/yx3SeLz+CFGnDf1HKtonC0GLttmb3IQlL8z4V4KSy2+VTcHqYAjQWC/W2ss5v5CefkBb2+aKM+zs/bYowHBed9+E0TjEqwVUKMf8ITO2xRcCgG64tmCI6ms5NKXAaKU17Wb1Wyr5hLaLfM0UWvhznVTInjt3gPdK3Zo8aj5WNcA6kKA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI6PPF1E8D3D852.eurprd04.prod.outlook.com (2603:10a6:808:1::3c6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 20:12:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 20:12:29 +0000
From: Frank.Li@oss.nxp.com
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] dma: ppc4xx: adma: remove unused async_tx.h include
Date: Wed, 14 Oct 2026 16:12:18 -0400
Message-ID: <20261014201221.1806634-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:5:3b9::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI6PPF1E8D3D852:EE_
X-MS-Office365-Filtering-Correlation-Id: b2fa45a3-995f-451f-fbd8-08df2a2f78ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	VLLJSdBo1LQ54xX4LXEK7Peu+ZandoJJq7nF34AeLhnsZvR1cBpQmSlVgpeEQ/bVS5NEB6aOFQ1XmyDqbFCp07P7MCKkTN2ae+EkZGWXx9LjCBUkyis1kVa04klgJNE+m+lKL8i3psWpzHflaEEqEjnRoMG3O1fT6dnVrzvFLSw/9bZybnV/iD7vwlBCqB6Xozyqx0o1DeHT21lWPeogFXlPRewfjJqdehqCdpARVjFiHwyn1WJ8T54ihtSk9K449Dp+pT/siF/KP7QP06s5k5V864Tv74WUKtpZ0q2KEvVGT/i5mOw0bB0u2wYr3wxS1Y6cSNF2p2gG+lI3K8f7k/hItWPwQSUrIBBHd32gYs09dm2CYbxzVfnVBX4U5bTyZNdusHc6td45RvoLWQzebIp6ZvkMr1WfSneHaFJavn99ln9zotGOoG/sZ6MMQWVe7ozboyUzQn2UA7/8ANgSd3SxhI1AYcE7BC3RYUBM0eorTPz7F0xsDzEiFZzE2VBg/T9jAvb+370hQXZKS1OV7CasrYhATnNlrlAQOjJQIoSrwo4VaqmleJYA8G0dP63VuS+a+XhIcEBcZDmgcMf6ojKNyCee0JeynSLYpt1u+OAHt2yGGt9CMgvvk3tLs1+IwcEORpVX/agHipJXH6RXijC9XVOuq1J9KNRaPUCfooE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jUvgkqB60nuHUH5sXaqkeeibN0oa4hkjP2UuYwcizSawV/xo7D4Rx0X7Lk+O?=
 =?us-ascii?Q?B1YN7BB+w6Mk96xwYDG2PEx7GNjd2Selj+mPYfbWwvQjQh3Tt/fWSR7nMzhd?=
 =?us-ascii?Q?SLgbC4ePqpRUfL+et+SAzAPlJ8D5db/oxLKEEudn1Q4kaBjrOyMz5cFxGIHX?=
 =?us-ascii?Q?no6p7A73TiOpYiGj/f3J0wuAeijRQAcZneDRy0nBiZZDY2+E/SXcz4b2/iBu?=
 =?us-ascii?Q?hGXfejt4lSwNZ2f5Db8J6f129Mg/1V43zWNWuOaS43ZMBWCg7B30/+O3qwrT?=
 =?us-ascii?Q?YyMqajIZJqXsY58fD/491uImlPhvObbWSZc9cO7MNeHYkDLJv+Sr0pu2LJfb?=
 =?us-ascii?Q?CO7w4whRF6BdyREnP5e49enORg3s4PuSikRUdU+EtuNQmOT9oA/zt0poWBoQ?=
 =?us-ascii?Q?aYu3KOfRWffZxihwBBaxqN0K5dA03dwxAQvyWO9bQobPfpaJL7E6GxRPK38L?=
 =?us-ascii?Q?WaaliJKreqtNWvw8ljaDUj2NE876aUVH8t6pOdJA/snjINymguob/KciJaAD?=
 =?us-ascii?Q?7gt5GzmILMVSSorjngJSJ5OFjwdM0oa2cPjkqC6dpElPIKYyH+8ANUJaoH/Z?=
 =?us-ascii?Q?6LNiqNlPVuybl7CiFvKVKDFqF9pNcoMwbj9cbCAOxebdF0hy+vtOhUlQz/hF?=
 =?us-ascii?Q?CI9nzKZOVDMSgDgK1Rm3rfyNp+KJ3V/cjvxoRUINNWWjyqXhuqbnoeTMgktK?=
 =?us-ascii?Q?GXTWqEU+GaUL1FNZGHDobn6AiuduX/+n55HjUmjCzud3/w+G6w3rO9qr3UKj?=
 =?us-ascii?Q?jeH9M7yf0sU0NFX669LRUTp6L0i23Tvgu2WqFEiDvvlCA7/VBII/ZVt+2Z2o?=
 =?us-ascii?Q?Brbiuil0yb0gymPLBJa3G61fnGqMPL0ANNR0N7j12TqLcew7Tu62UHvdwD0g?=
 =?us-ascii?Q?qK+A3H5T1YteyQBOxfLr5mt7y/kwktxu6iFXcgNUN7M1/bEqlgIUoidajBDm?=
 =?us-ascii?Q?ivOT1OBHZdwRNdC29ebtt0Sdc4kWmIKzD+LnhkTGFDsJNaYDfvy2U+gOhbhA?=
 =?us-ascii?Q?OKbgQniTiqMWuKMwa/flUJfl5wYqRyC44ZrmAzTBqN0cMWcKcOWlqaymaHoF?=
 =?us-ascii?Q?/1ioqOqORvMOP/NccZlWZMZ6w45/uacSwuapye1vO+z600lbqCvqo33EPvEi?=
 =?us-ascii?Q?MFd2JQT0H79+K9AbbPpFAyAXmEoz1uXkWIX62NXHMFgPKms+R4oPKiffTW2n?=
 =?us-ascii?Q?AAr/Lcz4W9qYISlGgN/bZKNxTz2IMFqpB53w+QhCjEXEWbVOTbfAvqUbf5UL?=
 =?us-ascii?Q?0kmsRCKLrZQtqXRP6+L0J5cujbrHBjhpbw7xXiBXmGG2D1Q/rWWyWqdVwQuP?=
 =?us-ascii?Q?V4zeRVe+LO6VVFuv1dsc5tGB3OAjH+JO+14j5cSnKXcX+y/aTcO04O6t6ghF?=
 =?us-ascii?Q?QhkGZV7eaQZ4p2qm80++Kq4GIuCESrWFclUm24k5U4gfVxppw+p9SF3bJjV8?=
 =?us-ascii?Q?BGWPDpOfh8yoEpXs7CXhStIyI1xj0nJaTJxuDw/75M6mjGsmCgZZBc4n7i2R?=
 =?us-ascii?Q?xDg7hUDnj5sWFmaui4H3s5mF1RtKFlOBaOd1xhZK7o6a/CBNbHyZQGECvzLm?=
 =?us-ascii?Q?QHK2XBkejuDqujZJ2JlyodLJyKLwwEMuf5bmoVuoCKypqVeGlWn3YFsIx0Q4?=
 =?us-ascii?Q?weC0DaLQeJ8jYtiLyCV5BYVr9GwWEAQUONrkxtyxGEzQU4H1NygHoTL8LgB+?=
 =?us-ascii?Q?1CqN0IHVLf99XcxgGbAFwLqZcZjg/DwNfYGU7/3RoRpR3Vp7cq3B9TDBENFb?=
 =?us-ascii?Q?265OS7ntVJgE+NpCVYKthF29ra5wBFYOJ72/hYHdEFA/DqJwJnDF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fa45a3-995f-451f-fbd8-08df2a2f78ff
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 20:12:29.3126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfRJnCkzGRRLn2MFEVpYW/kuqF6wYAxN+fWU+PX7IAFedKRDhKh1pTo5qOh4t+YLPGicfRqZc/GaHGllqtWmXPNpJqs/nlCiMhJvIiMiddUVl4PqppnSxY7G2ri9hdik
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF1E8D3D852

From: Frank Li <Frank.Li@nxp.com>

The async_tx.h header is not directly used in adma.c; all required
types and functions come from dmaengine.h which is already included.
Remove the redundant include.

Reduce async_tx.h user to prepare deprecate aysnc_tx framework.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
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


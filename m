Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021106.outbound.protection.outlook.com [52.101.125.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7223F6606;
	Thu,  3 Sep 2026 06:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417981; cv=fail; b=A3k0xQ0oFlq00MhfkMAF9NwRZ95FgOkL2lP7Y+D4tsgbbiBoexek5yqCg4zQPkJ4qXy3g0AspyWMTewmjKB0qQq3s/6bcYrU1bIab7G2dHShobtPyIm5uDF/FF6q957AmoVye1p2KdA82IsG6K1clZ3UFb5xWw7iMT/UmyWnh20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417981; c=relaxed/simple;
	bh=paqXhchrRlkxUoCZ6omJZqjBwF+rNPPJ7qUKY0omTZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B08mUW236R8Dxsn68Iscj9O/y8dnjCYUtdX19nAtFiF8rw3Hor0nHaYUp7Eqw6S5y1h2Kr/bNqU4gGwllX4QviiENLHfH1Ly570FvvQ2nBT3UaZuFm4EEHbz67jaSvNya3lgHJ6MqVztx27LFJN28/OIBDX5CTZrTB6CllrN4C8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=qM9TwwHD; arc=fail smtp.client-ip=52.101.125.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="qM9TwwHD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5JcmkqAmVnQ4QouD8RPl/oMXHFyNOa/w7DJQYl42KW3PxLXC8PBDjMLNg+2IxQ9OuTLXLGXkVfz+9I6jNo5wsgu476FNc6tUQCc+l1Lr4LjKlnYbq4QkxdUVZZShZAWz+Cnojf32yon8QTMjt9yGDIFS2Qq03jXFokZm317s0PD8Htp0RrvUKXCmU3oGk5AuEiUEoxgR3rOLabE6D2AmhCQJ05iMz1sWa0ozvdqvXzjEAi6Lw6E7olzsL4/hBgkcNDZg2vbrU+0i+yECcHcPA/6ZhHEmz+dsoozv4UW9GKK8FJ3XDWFOlR3Jbhq+PHjinjQMfqlILhiLHGaZ/IKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzkBaXoYPBkovehwYxPt9AGLBPX1XHxlU+sMH1JwdC4=;
 b=Fnp9xcN8gDI5bV6qNGIvSaPEbcKuT74VoqECAmvXbS/Ohzm/HvfnVuLD4Snp2DU/jo4mPHtp9oRivv3eQrdvPWcPjWK1kW03RX7UblAhzniTrh2X892bv2Ptkaz/h6m/KEMTsppKTPFqMDJyhEjMWrOB4wRC3IF1+jI5ObfsjxLmDA2LlYm8VRe1+NCP8PKnMjDMqAkMTGdI+GeJXQ77dbcqPtwQIjSAAwWz74RMwyIBAT7XMZHu7HURITZrpXK1GfBeZS+OkPgZanBKGtvzwhZl70/mXKS7bD39nBuZ8lEbMVElYw1YMhQ2rrQSPs7ZQE4xCI82eVt9qV0N2Qalaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzkBaXoYPBkovehwYxPt9AGLBPX1XHxlU+sMH1JwdC4=;
 b=qM9TwwHDfAWtt64Lryy99/caVUEnK1xHGKS/MiMY2XU30F7W7Os6Z12jOJp6opYb93zVXhUAGFIbNrF7ywxPfuQ/dlDXK1NBHYrvFNlWWraoXprSrA8VVvfOeoTWnINDraUsvKjdHHf5pHhj/ev+gkvO0M6do5cvcyOtZbLUw4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OSOP286MB7980.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:479::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 06:46:00 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 06:46:00 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Devendra K Verma <devverma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] dmaengine: dw-edma: Account for the MSI vector offset
Date: Thu,  3 Sep 2026 15:45:33 +0900
Message-ID: <20260903064533.2269557-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260903064533.2269557-1-den@valinux.co.jp>
References: <20260903064533.2269557-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0068.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OSOP286MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: 7adfe376-32c1-41e8-2373-08df09870421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|376014|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3hYeoEnPVugXs1G/mr/Ac4Aszyial4blngYv0L4wYJ1INoLIdiCkfQRZEtdIHim9ydR7ub7eZEh6EmcauaSBf6JzlS0a87yW+WGLG2ruy2SWRQkZhqkSCr+B4fUO2LhQqCfhX12JEsX9xxmlpMqAV+/1d0q4pdMP2h3p1rDlTImDRytOBEwHXW3wqNOKpRgZPZ6GQPBDpauw5HzsueUsu60VksUwKwxsx/svqX1ayE7uj2qgVpelow7hf4wzVTHYaREqYdonyDuDE6j5TqssE16RfiUwPwy/uJIWml3t3q/pzTMhoVuitqV3cS1DYVH9XZXTeKvX13BRE0EY6NleCv0cLj3vf6ilr6lhM1Ffb2VIAx8dBghSubBZBcQwYG9Dx9W6o5b7lSkQ6UN/5LdfoBRGvEltoskJD0Rr7ORKMkvu//HS+Dq9zIk3NLtjVWeDAdeo7VVgD4xhBqpZdVWbZuGq4MROfUB5LEN30DU++BYt2d7AVmuypwYLsQT5VUZvtDM+z0n7MZh5uoeHWwHZ9g1lgwNinnGm5uCACB2jwD0WsFECF+yWacHiFYb7bv/DtmvDFc4pbV0/b5280sX2aj++lPdAHOGCHOIKzASbFtXOqF7dwHtAIkaNlCG9TRoRQev6Sw9jXqrx7ggXR/7+YAPCTCk2fGbeKMhNZ7ZPGj4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(376014)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ch7PMTrXIZwsRzrBRws1dDnBpXmg4ltcfFYcBpdL3mQrVMFl7vc2ayR6v1Oa?=
 =?us-ascii?Q?1Dp+MT2W9Wnyk4bbm1fdpfiCCiClML4Jyu1YmxfqiSYtlh56edIgQSloXeXZ?=
 =?us-ascii?Q?WUxFBj/QLZWuGhn9+v9nq+0ByYkvYFO2v1rj/9rI3Ley+r0Nu0FwGmL7OQj1?=
 =?us-ascii?Q?WE2GdRjUQA/ZxOd/BjIN8N/lHE19eYjRMe1bA3OuklT09Zyg5qddLyNk5SFR?=
 =?us-ascii?Q?+q+SAiPKWhlu1a4Zv5iHQWQ+YsbylzjSyqCR8wW++eLdBvlK5Pcw2jaOjski?=
 =?us-ascii?Q?V+4F56/vVIStR9MaibK8GwJ/A2JcPmveAz+Bf7gvoY1qUDeDWaqhDCOnEYK9?=
 =?us-ascii?Q?3+awYkVXTS0+6Qbg/YN26nidhfw8VH6YmTyAKDaEBMNGkiYRZnz2eOvMak8/?=
 =?us-ascii?Q?SBJpr4JIc58fxDAiUyy0j0IzwJr1J2T8SKZsPB+034LH7wN6pLeS70ITuWFj?=
 =?us-ascii?Q?SRhEpRWrKgFNgPZRMyGGIKdBzGWjCy2SbrMTw8StyoU9xAcFR3RoNNAchZwY?=
 =?us-ascii?Q?mpPk2AraJ/Xq/uCi3gD2cAs+WkH2xZLGa8Dxv/ItJmkpAW9Hhl0AQ+XU1CTW?=
 =?us-ascii?Q?DEWRHEiRAM1my0aRwEgwBi3aG7oP5Y9eLKOYrn6kVdQvFeZARD210auMQvPA?=
 =?us-ascii?Q?oXHOSXJcuIfRT6D5z6xSKmR3i3TRwJ5nJn6S22K5sCcIIhtWrwdnfAkjXpkO?=
 =?us-ascii?Q?DOG/kx0zckM6GRZpwpM3w2cHOygVE3iq6hQbLQ0ot2AqwzbEnWfnkXDX6c1y?=
 =?us-ascii?Q?facyZs5VyiadGx43QRhoZjTOTmpQLQGjITuC0TZAHdBb8XQU6c2asDr+irUt?=
 =?us-ascii?Q?EMnVCHIUgGe+LrWLVeSLzeiApDkhYi8k3p7W5A0TwxjWxrPsVQm6xPYCWxYM?=
 =?us-ascii?Q?c7zF4WydXOJYOoN9ItSeAv23CPMKiFZDp2tmj0ydThwRVLt8KNspbcbC3JgJ?=
 =?us-ascii?Q?aFzimk6Isryxzys6D71JX5yOz2GRBmGb6p7hIHa3SA8QWtH4cU2+nNb80ztd?=
 =?us-ascii?Q?ZYFEp05zRZJCDanSoLpKJUDsJKWwoIcnWbz2FwU/slEdQqFyRO8uBzri1Wqm?=
 =?us-ascii?Q?PFCuWcoOkKEr9aqKjp15BSNVp1hxuFc2XF6LOM5yLePJ2RVsEqYst9E5Pd1y?=
 =?us-ascii?Q?5Av7X8QBzwhBeXwMVbzAIZayTpQNiuxOWKoM7mtOkqYHVy6VozsBC5SYU63h?=
 =?us-ascii?Q?Drkcvwi2FAe72tovKI+DIPMGH2OFfp5O7l1V9dosi08IPeLGjWwXfQSDjgS4?=
 =?us-ascii?Q?fQV2qx66bfYUviEEV9FRmOcu+98T9aUs4afbmKNjGCoHhaOvI+cUxbcgo9GT?=
 =?us-ascii?Q?c7LMntvlASByDeLRY/VCm7Kms0D5P0Z7AcvmJubwvFK9l7eej8/QSwbn1YCb?=
 =?us-ascii?Q?7utmxTuwj4rkSt5cb7b1ZuN/0ThzT15QYfcRH9BWyKm+sdHdrB8z2gbrOtCp?=
 =?us-ascii?Q?Cm0bMltlMFAhKS+lfbQoAlESEDnTaOaRZuUm97kCuW1620iSuE0gKzAzqz9v?=
 =?us-ascii?Q?Qd6uRMRD461rbNeOj8bh00oZrzYMj7u+tHSyq3TCC9qze5dPmXbMLRLsrMVW?=
 =?us-ascii?Q?A9xwigx8lVR6zyW4JJQ1Y8080xggy/K/pi1vhCHUCOh1ogVHQ+II6mPMi3d0?=
 =?us-ascii?Q?963GWqSocXuJ5YPaUO86CvDoUiXgOeHJ0IMZRdjfNPaX3HAnQqI3ypUrJesL?=
 =?us-ascii?Q?w0mQ5y+bdYZawppLh+tQcOygY1G8Wrd38VTHwkiAFlI7XsaEAySQgIdGrJ4h?=
 =?us-ascii?Q?iTzfSDynLNpApd8KZ38GINmfPx/jMct74q6H4DECT4ibICFd939F?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 7adfe376-32c1-41e8-2373-08df09870421
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 06:46:00.5166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXgMcjgDQ3JB5yOyDZsGJ5DKvjmpMMfchbG3ZwHp9IfW8vPrCijz/Jikpa/+jBCvRyuc3UylDAQwEvnE5ZIluQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOP286MB7980

get_cached_msi_msg() returns the base message shared by a multi-MSI
descriptor. dw-edma currently derives per-channel data from its local IRQ
index and does not adjust a common IRQ at all. Both assume eDMA starts at
the descriptor's first vector.

That is not true when eDMA receives a tail subset. Compose each message
from the IRQ offset relative to the descriptor base in both paths.

While at it, avoid reading PCI MSI attributes from descriptors owned by
non-PCI devices.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - Pick up Frank's Reviewed-by tag.
  - No other changes.

 drivers/dma/dw-edma/dw-edma-core.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index e3786d960a43..5e95b3e06933 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
@@ -1107,12 +1108,23 @@ static inline void dw_edma_dec_irq_alloc(int *nr_irqs, u32 *alloc, u16 cnt)
 	}
 }
 
+static void dw_edma_compose_msi(int irq, struct msi_msg *msi)
+{
+	struct msi_desc *desc = irq_get_msi_desc(irq);
+
+	if (!desc)
+		return;
+
+	get_cached_msi_msg(irq, msi);
+	if (dev_is_pci(desc->dev) && !desc->pci.msi_attrib.is_msix)
+		msi->data += irq - desc->irq;
+}
+
 static int dw_edma_irq_request(struct dw_edma *dw,
 			       u32 *wr_alloc, u32 *rd_alloc)
 {
 	struct dw_edma_chip *chip = dw->chip;
 	struct device *dev = dw->chip->dev;
-	struct msi_desc *msi_desc;
 	int i, err = 0;
 	u32 ch_cnt;
 	int irq;
@@ -1137,8 +1149,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
 			return err;
 		}
 
-		if (irq_get_msi_desc(irq))
-			get_cached_msi_msg(irq, &dw->irq[0].msi);
+		dw_edma_compose_msi(irq, &dw->irq[0].msi);
 
 		dw->nr_irqs = 1;
 	} else {
@@ -1161,12 +1172,7 @@ static int dw_edma_irq_request(struct dw_edma *dw,
 					  &dw->irq[i]);
 			if (err)
 				goto err_irq_free;
-			msi_desc = irq_get_msi_desc(irq);
-			if (msi_desc) {
-				get_cached_msi_msg(irq, &dw->irq[i].msi);
-				if (!msi_desc->pci.msi_attrib.is_msix)
-					dw->irq[i].msi.data = dw->irq[0].msi.data + i;
-			}
+			dw_edma_compose_msi(irq, &dw->irq[i].msi);
 		}
 
 		dw->nr_irqs = i;
-- 
2.51.0


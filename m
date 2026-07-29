Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020091.outbound.protection.outlook.com [52.101.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29034D8D92;
	Wed, 29 Jul 2026 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335459; cv=fail; b=cruequ5hZ6JP4+zGLjDt4wqaVsL/gBGYHPD2XBjDZKRmzmut+kxpiG4qOqX5esDm5c6yijGWq1szkhmt29LBdfDEmBxt4CzUbvzs9mXTpnDyAxgKoDf/AheaN9t0qJDF8aGqt+2I0Hrw1JhnL/gvW5EmvCVKk3bXxGHZpsjoiOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335459; c=relaxed/simple;
	bh=Jmnzk6E8t3m0UjNQLHuno60GhB8o0VEDgqyx7LTiibA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aEOjcwCBP0dFevvWIOuMgRWzCiZ6ts7qIe5eSgzoQSMSTnsJKmLN3irbyVdkxdwx5QShK2B82uxmpe+fcnn6K9LtMFkb2i1hMX3rhQczeJCG0+As9OH/6G8lzweZ9B5dMYBJ2KOGX2yRisbDk4P+yCtOWqbyDVB7ivJG9DISWP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=wFUWyFV6; arc=fail smtp.client-ip=52.101.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="wFUWyFV6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbvprn5mzlBCVJIe2VbcGA+FehCw1pY7CiKajSvFqYG2uuJSTfygDd4+MXjBQb66aXmQpC1+GYFK/Tpw2dE8xzq3FjT/miONm0iXMgrSZQNhXDd19m3MmG5fxYjnzAdsgtRQMc+riJhK3kGdcfNlPzxNIk+zwCyGYdEZkmKaAPAqCwRSgvzmjM/KgnYEcjTgWslSkctzzl6A+sbEEo3pd11x4VgGDH9gM69d4Ud969qPR7yZY530/mN4ck6Hx9cG3BVGQ1UVgdpAYykpFbrxLgFcvonypGM2ByKu4nE/LdbBFvU+e24zD+d4TN24u22MF580JMzc/HhobtRgFXPjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODasWcxJb4TdZsyQGiudeul2Jvg0b82+JKh5PT+oZ8g=;
 b=cL2+crOCNytOqgqcE04xJsYo0dVwHwzBlK750xKuIi9jhuCUaD1GgQeB/8IRmZh491XHiX+1Ce8RYQpreBntSn9CYu7W6kdzry9PgiAbpzKWTWjk+ahfBqfcX98Fq5bSU8loV5IyZ/il9KsyJCu8MWCv0aJZ+3pyDvU6gqI8XwjF7vF2Jo5Qcp6BI0Bq6ttXh/DraINpgOeU9wHZJyyZXdyb2yTgqZDR2nJcMzF4HrNmBxM8+9vtDThG/2yXLrnV2bYbelmaAbRgUrGwecmo7HRefVoSVENVI6oCBu0XvmSXNwutInDWgRQSen4CqT6eUGKdRRHCptkzIu/ORlunPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODasWcxJb4TdZsyQGiudeul2Jvg0b82+JKh5PT+oZ8g=;
 b=wFUWyFV6rMKulzJQmk4auJt8vXmKutoT9ytmyXKGHYXs4vHKlMZR1TmU6MD3t0MyZA3itaxRiV4idLYWuDYE21DEgVDf7jOv3OETk+RX2v0qi+Uvcs+xpr3e8hjGSdDZOcEdSHAz3xa4wn8oMhRG7oqxiMWjcB0eeXgSK/ouAJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5289.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:30:49 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:49 +0000
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
Subject: [PATCH v4 10/24] dmaengine: dw-edma: Prepare LL kicks for event serialization
Date: Wed, 29 Jul 2026 23:30:22 +0900
Message-ID: <20260729143036.3087722-11-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: b3153e1a-8a7c-4a50-b5a1-08deed7dfc60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|23010399003|921020|18002099003|6133799003|56012099006|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kGRlcM0HfIvomdP08dE99P2k6Oy+76Mk0JWW4SL3FZRJ+9YMJS/9PgypKbOElyhcfN/OCUWntcS8VSSK0tHmmVESTZOEMR0h/RBozDNMpKuOk0PN2T1FnNqRbJaxcuW/KCSmvcBKSfxY4TIvUYWPzswLmfPHr6vYcoTL3sqHAhqzKOaw34R2q4n7pRCvH7NY22QoykrxSC34SZ76ioBXvMvwfJqQlsWYysMh6xvK66AWiryTIfl3bdjzKAZ8YgqB75YFx+t9bwXMveR98GZ1SErCbTRrtb9BXlBPV+Xqcjlqze37paaupzsroSuF6Yq3j01zZvNHL8V4dUBGG+CW9J/eVCuX3+sNtJsEhGF6Bd1U6tsu1SpzvLYsKM998IfY5xpMxbBQa494CfbFKAwm4Hf0s92ccVMKcORPSWmhuK3cEVknSxlcm93Jig265HakQ7vKhkWCeV/I2+oqBqOscnqufZMcmi0nKiEU+OzrDdRZIy4+H71+Z2uX2kHRjnUoQPpELDBPRsDM8x0YwmrD6hanDkNFUU/pjJP869/P01LqN+cA5JdwOaCom5KJ4lbQxkqaBsLAUNFeyvVcOvcf8IQw6M1EEYmnHAZX7fCRKRp4lm5q1wT+Z647dFusXy8Qpng6xMvjAN6cExAMgSuyTCfBwGm1wV6tOfA65qPtwDBBkUKPVcT/x9Acbpc4GkdYgnJcZlMQI2A8y+HQyK2kGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(6133799003)(56012099006)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JNDSTrTPklsi4E5q83j9JvIOdHa+M5Y0h+7MR6x0typRtNerp/tOsgKEsdRG?=
 =?us-ascii?Q?KXzoeRN/O5K6aiGjTtpgcqkhFZe7E5Nyd74gGn9RPwDj598yv4HyMeiFJJgY?=
 =?us-ascii?Q?LRchcrtbKaTj0krxPnim5RvEODuPYm0P8az5xJfOWndlAl9dTNeOP9Hc9E3A?=
 =?us-ascii?Q?twqPuMzplkV56APLBldpqCYBZ+kmUuRPwpzV3pymVtdqSpw1KeEGhfJbkyCr?=
 =?us-ascii?Q?xgMB7mGCROZP2SRu4y9qP6p/TGkPlpbE98NqyvXu7shboLRXyB3vp1FTPpVV?=
 =?us-ascii?Q?dT8ED+k6BrzabhEsPPqtUskGh1F+Ft3lZiTTfBNNbqjTaEBqy6thgEgzgKqr?=
 =?us-ascii?Q?tHVemu39JJahqC80fG8Gda7cb1OzLKYes3qNz4svWNMe8rtumhHy5CWOmvMS?=
 =?us-ascii?Q?ZKC+n9QhuraOtTwunUjye3nNK41KN+G/VGaBPkDWZ0pBemjxBYfPG+PHxmyf?=
 =?us-ascii?Q?w16HA9q1lqqBoMTw3zgr6q041pMtk2OldNkfmudErRpRgTpznmTFohuI5xH3?=
 =?us-ascii?Q?xpxJiDrzg+HomGcGNlNqPWGXqavv2gCw3yq84zAgQkG832enq6Sd4RYKB1Kp?=
 =?us-ascii?Q?ow4PHVIhgGZqf4p3XxRIYeJZpjbfgPqrGw2qCYoNyGFcuwCpkaeNlyuekytZ?=
 =?us-ascii?Q?rC03f8HtCjD8OM8wQrY4VP8TTP4OGB+lBdhKmMuwBAtTvCfzp2eSIHqdKr9l?=
 =?us-ascii?Q?Y4ttZnA0dIdqmLQ1VPy1lewoyKWPfz1SYcEahu1A2tfTqlJcDDUEqQ4jd/+J?=
 =?us-ascii?Q?CZzvgzDRK+vHa34wC8X8TptPp04pbZLMPYfQ2WK/C0EfQRu4cutYGKPg15qT?=
 =?us-ascii?Q?3RLjzuXscBfLLXujpGklzlDdZoE2wGK7Iu76461UdfhkIGiO+Xl9agHPMGlU?=
 =?us-ascii?Q?JH55n4A5rTEi+KWHtPHPWcG306JWujp/Vdi6gUqMeFrcnXl9S8bTD4p2YSB5?=
 =?us-ascii?Q?dqX8fl+VmANkw1mi/xYGeLBtlBdYkJgv9vMxLhG9ndG+mbLbcGMPcDVmrFm0?=
 =?us-ascii?Q?USYvqrvXjsuldO/UZSwaX1ewC9OO+g87dBIHW1VQpdZ6fMgpItZfFFwoRxge?=
 =?us-ascii?Q?kl01qVmHbMYPr5IWqXD+LjJ8dVfOjS6Tbf5D7S7+YGi5ekY/5dD8waH96vlJ?=
 =?us-ascii?Q?b+xihvEHIkzDNi7WIJks1txNcNwHKZBDuaXB6wJ337PN/4+qFVEcnor1o/ns?=
 =?us-ascii?Q?XG0ssXkWQYnM7XmcpOGl6xdygDNEdzU/i9GmZgdAfq4rqD0uWD1NO75ouDrT?=
 =?us-ascii?Q?ru858+b/A7V+iU2tBj9U4FORO9GjfdVdEs+PUH/X6SXDqmTSt1yrpMpWkWFZ?=
 =?us-ascii?Q?7IztHrgNRQDY2SCy5r/1PpIcTPJ3/7I5Ig1QpEcEcEVIIuWnePQ03qCtKrJh?=
 =?us-ascii?Q?i+Ayp/ASnuavGpiIb2AmGb6R+Vehbos+6AavnS/bYCtVsKltm5Z3FqMvqZBZ?=
 =?us-ascii?Q?d9VYqtf34pkzHWmONU4nc0gH8WmB/z0ymj2wyOL63JsqzcEjB8+4YRKQ+cnb?=
 =?us-ascii?Q?Pt6/hO7trY84YdZfwYmTbRfEWQ6xYtalYWr0+uIpovgF7jH9/mwfFaY3a1Gn?=
 =?us-ascii?Q?lP6LIOcsLriWNI3DwPPftneyrrmoyhjvFfaaiZ50Wyx6UBZbSCNlEVRid9rB?=
 =?us-ascii?Q?PiTIiKW74OFLke153+jE+Y1Kx11Kt7Bmo0UXOwhVYUtyt5xlsH4llpBGLd0y?=
 =?us-ascii?Q?9N2fyKeyDkxw8P9M2SFDkBcJtdkyTJk+qxfLF6qUjowfocOOI5wnZdxQX3kQ?=
 =?us-ascii?Q?P2gRBHQtML48lfnRrpJ3HWe5IblyrGe9Vzms1iqlAxOSDUoZCnhO?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b3153e1a-8a7c-4a50-b5a1-08deed7dfc60
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:49.4692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46/+qtCLhm9DgUTHwsEZ/eawi8DL43LevrqL1uMaiR9KYYIkGeCWoBxaZODlIlepmCt7rrrapUMWohMabdlsgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5289

Both eDMA and HDMA perform the same remote LL read-back immediately
before writing the doorbell register.

A later patch serializes each raw doorbell write against IRQ event
capture. Keeping the read-back in the provider callback would hold
event_lock across a remote read. Move the common read-back into the
high-level dw_edma_core_ch_doorbell(), where it can run before the
serialized section. Name the provider write wrapper
dw_edma_core_do_ch_doorbell() to distinguish the raw write, and leave
dw_edma_core_ch_maybe_doorbell() to decide whether a kick is needed.

No functional change.

Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - Make dw_edma_core_ch_doorbell() the high-level operation and rename the
    provider write wrapper to dw_edma_core_do_ch_doorbell(). (Frank)

 drivers/dma/dw-edma/dw-edma-core.c    | 18 ++++++++++++++++++
 drivers/dma/dw-edma/dw-edma-core.h    |  2 +-
 drivers/dma/dw-edma/dw-edma-v0-core.c | 16 ----------------
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 16 ----------------
 4 files changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index bb57f2d39d1c..55849b0c862e 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -13,6 +13,7 @@
 #include <linux/dmaengine.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/dma/edma.h>
 #include <linux/dma-mapping.h>
@@ -254,6 +255,23 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
 	chan->status = EDMA_ST_IDLE;
 }
 
+static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
+{
+	/*
+	 * Remote controller registers and LL memory may be reached through
+	 * different paths. Complete posted LL writes before the doorbell.
+	 */
+	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
+		readl(chan->ll_region.vaddr.io);
+}
+
+/* Must be called with vc.lock held for an LL channel. */
+static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
+{
+	dw_edma_core_ll_sync(chan);
+	dw_edma_core_do_ch_doorbell(chan);
+}
+
 /* Must be called with vc.lock held. */
 static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 {
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 6b0d475bb8b5..00ddcaacd671 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -304,7 +304,7 @@ static inline void dw_edma_core_ll_irq_clear(struct dw_edma_chan *chan)
 	chan->dw->core->ll_irq_clear(chan);
 }
 
-static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
+static inline void dw_edma_core_do_ch_doorbell(struct dw_edma_chan *chan)
 {
 	chan->dw->core->ch_doorbell(chan);
 }
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 990cad7f0e54..e254e9f1e613 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -480,20 +480,6 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
 		  upper_32_bits(chan->ll_region.paddr));
 }
 
-static void dw_edma_v0_sync_ll_data(struct dw_edma_chan *chan)
-{
-	/*
-	 * In case of remote eDMA engine setup, the DW PCIe RP/EP internal
-	 * configuration registers and application memory are normally accessed
-	 * over different buses. Ensure LL-data reaches the memory before the
-	 * doorbell register is toggled by issuing the dummy-read from the remote
-	 * LL memory in a hope that the MRd TLP will return only after the
-	 * last MWr TLP is completed
-	 */
-	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
-		readl(chan->ll_region.vaddr.io);
-}
-
 static void dw_edma_v0_core_ch_config(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -624,8 +610,6 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
 
-	dw_edma_v0_sync_ll_data(chan);
-
 	/* Doorbell */
 	SET_RW_32(dw, chan->dir, doorbell,
 		  FIELD_PREP(EDMA_V0_DOORBELL_CH_MASK, chan->id));
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 8edec9c95cf0..af4ab43d00ca 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -282,20 +282,6 @@ static void dw_hdma_v0_core_ch_enable(struct dw_edma_chan *chan)
 		  HDMA_V0_CONSUMER_CYCLE_STAT | HDMA_V0_CONSUMER_CYCLE_BIT);
 }
 
-static void dw_hdma_v0_sync_ll_data(struct dw_edma_chan *chan)
-{
-	/*
-	 * In case of remote HDMA engine setup, the DW PCIe RP/EP internal
-	 * configuration registers and application memory are normally accessed
-	 * over different buses. Ensure LL-data reaches the memory before the
-	 * doorbell register is toggled by issuing the dummy-read from the remote
-	 * LL memory in a hope that the MRd TLP will return only after the
-	 * last MWr TLP is completed
-	 */
-	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
-		readl(chan->ll_region.vaddr.io);
-}
-
 static void dw_hdma_v0_core_non_ll_start(struct dw_edma_chan *chan,
 					 struct dw_edma_burst *child)
 {
@@ -393,8 +379,6 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
 
-	dw_hdma_v0_sync_ll_data(chan);
-
 	/* Doorbell */
 	SET_CH_32(dw, chan->dir, chan->id, doorbell, HDMA_V0_DOORBELL_START);
 }
-- 
2.51.0


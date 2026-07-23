Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020109.outbound.protection.outlook.com [52.101.228.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B72940F743;
	Thu, 23 Jul 2026 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796138; cv=fail; b=p2wWthwpuWEJM/AsVfC1t9lWOrEHEaugpRwDJVGbYMzj7wREG/FwDPtyOX3e+kXER1s16ViFGm4Y65fwK2sRAoYCWyp8bYS+/i9QJ9dDBCiLTIyKzVLXOr1iCYB3PUgwMHAmeKLbZPqqVDDJMXyQYgma1uNu+Hyv524QEoWKNNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796138; c=relaxed/simple;
	bh=fML8KP3/KdcczcZuNETmz+VHhTgDlsACb/f8THSZqTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fNCsCITSSWEKmX27NhcMrTeulmivKa2rQ9vgWw0p1MzOxQjMCRd6dz44+qRclE+WSYABVaLr6I2nN69uaMzpbQTAhA+ILEB7knSQwtV7Umy6xcge+ZZG16hRldS+SmaNShtGvZuWdMOHcnTfx0aGg/hcM3/c+iIWNuU9xUvzWDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=MGbKuHEq; arc=fail smtp.client-ip=52.101.228.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="MGbKuHEq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyFwYwU1siCe25oN5SWszUDY0qGvh8Ql4rq+qyjrr0XnfoypMTgUFPhRcn3wv6dnhzRawLGag0ClWL9ZljPyYanoOEyxt1GB5PKFoUzIqYbFuTf0SkxO5a77FGQTxIzRV5mtd+I1DfjOjNworx/y3kYdTc5VkdflFREnt4n+EpjvkOcGyhQXDAIU0gIRssMaMGwuFWQx2DaqtQgyVXez1T1dNKbh0CTtdEL4B9q1WCcPKNERJ456QKo9DKrOZKTrZm7uw1/fOgnt1LnIfOjA+YvuIUY9aJQBDwCsMnpVQszVgG5GjnL0mkkL2WBHwIMhQ0LcbXX+ArAfuJ6FSQD1VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hv0n5Xdarih6o84FJHQdVUhmWhgIOnh8AexwTrACW9E=;
 b=TJbr5guf4BFs8mmcjPcCQyE0OFNuLPTv9IuDOZaIzdJbhEGwcZ3MvcPniv1Rtjw6S4h3afWoyhEGo1naPSsMVo/CK7jKdX73jUlb2tRypLkJW9jpXhxERKnEUCEKNrlfVKSojpVK0pxoV6O06DXnmVJ0sCvHNb8iuqagOgmmhy6DddZ1G2xkKg30uL6FcVsQwcqnuHRZn0naSiRHsj0BIZq0uv54qWtCBoI749OQMe1gdkz+wf3ubMJY36od/ynNy0D0bxtD4Tx8Q7XP7rV80XVR9LJbZwK3+EULW8/MOLnOxNKAiBUntt8umuwmqRoL+0ZEMHG48IFTAz2aP85toQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hv0n5Xdarih6o84FJHQdVUhmWhgIOnh8AexwTrACW9E=;
 b=MGbKuHEqBTllcz6UyWbcvrgEiwTq5MjmMgmJW7ntpuznp6GYXEMOSsJyPKgBsqB9ZjwoouoisVs081RQOkFr7LFHxt01C1uJ7B+A/rwczoEPlcQO9xOW3DsG7OtW/TYw9QvR6nfl0Eyoyr+d62Tg4T8kvZqpRxXYZZnm4M0SWd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:42:05 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:42:05 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
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
Subject: [PATCH v2 11/19] dmaengine: dw-edma: Reconcile lost completions from a stopped LLP re-sample
Date: Thu, 23 Jul 2026 17:41:42 +0900
Message-ID: <20260723084150.521366-12-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: a7e49528-6c2a-440e-f52f-08dee896461d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	X9MEH7T+ExFMD7nwomsj0faaYbPh0vRW3sZHKQ4jmXmykpRoKdUObHRbsaK5e5vP83qBWpZCwk1Y+OmN350DO19LtHwzEE9QUONRJyrp8AuI2Cju6GY5N/EymEQRrNpFw2/zBtw7N/vFGIPHeHn6wD/N2lcXI9FFlUi23GdpgKOiuFaGAUjkE/xkyC0bd+JE26QeOl2vtZcdg1kCed0vdrf8/6ApHHK2V0orMx93QiRTUkgx0nhRsbaFG4fReTGWZrv9zbfnR2NSm1B8FLjoSOMrJyel4xYteny9W4HHuzNtxDrkmv0BWmrYqt5hEfZxc4z1sCaBh2xy/ejNMmNAAk5YIibrzJOiGr1vapKjEgnB6ulnuBPoIfmRBnrvjpPQzAEybR2PyW0MerbL58kAfHUB4nQP088IsZ4VnCeVjlAqddLcFGPCg+3ruKbKKqljHZhaf5sCpjYg6+BotqI7yo0YXh5XgrQP3qIX8zF2SFaGuMDklzuoSyRUdMiLG5DmDaZ9HSHrYB89gElU+u3HiskY28vgHrzrPxpr/ljCF4aJbczCD+iG92JC2qJ0E23haILKi4MpQbH8uPIT44aosGEfBom9Dmx8sHEMQwv704epyvK8mvqXHqcl6QcJ4chYIdMA399SS6QVN0HDSweTiUJy3tuQJULcNHYlz64Bnl+8S/xsUYvTULIEimehh4kZ993SKxGD2ivroWUP2Ry2Ow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N3seL//g8DBAOvS6zYRyNdTqiEImbD7zzJxyL1Dz4GSg0WVB2uoQBWHcU3Gg?=
 =?us-ascii?Q?PIlQTNR6KvjTZSCohEWsCmCf4rFSBtNsrENsRYp0Ic6E8a5K9ibhhGw3G6Be?=
 =?us-ascii?Q?sTcIWJfNnMecQZoudNqmqhsNSRhlV8vv1n/MTxKsbEyEE1Lrtpygp/b9IDzf?=
 =?us-ascii?Q?Vv+zgB9pypbmg9sb+Z4BPMRgDHafZ17bTlivzzjzc1aRybqRva2kdyP7DFH4?=
 =?us-ascii?Q?9oCpjbgWQSHkXnBG4OYxoCyBkMJs+uPYjnXpJAHtZVkwfI5EIm27z7tpHQFk?=
 =?us-ascii?Q?RSjVPx96oEHZZ7o87BjseQNUsexOnD/YGmdX/4cpqIAMJFPiN7XvrfdAkAQn?=
 =?us-ascii?Q?CEm88Du/k7GPcsclhL7/41qPyzc8P4+8cZKxAuqISKsbOkBQ+zGnDGEh2jYY?=
 =?us-ascii?Q?g+9zfYaJ1KZwYSjIHkVGf/tPqTzBNCavENvVZ3wH3V1P8K47FTJhoUYinPZC?=
 =?us-ascii?Q?WnrBLr7+c03Zw69QxAl/WZ2OI+tiP/dmx1OVRVcf+tpucMzbRuegRXmNWebk?=
 =?us-ascii?Q?LXy9g61Xxzkl2lpuKjSmedLRV67MeyWC+KUo/o6sEDJqPuyV0Vmj3jSldUbM?=
 =?us-ascii?Q?MK17nlsdqtFXpwyTgDqwH4Q5j+LvI8F/DG7FlGHviXvK1HA1kn2I52r8sYEY?=
 =?us-ascii?Q?bSKnH0xm9Ys91Ft1WbYtNhXs0PxkDeYSRNOW+1CGKcGcJNy8jqZnlgNc8WDh?=
 =?us-ascii?Q?TYNZ22r8u4TYi8hNdnn28lx3fyq5sQ2nXpmzd37Ow9N2+GgcO/5g/6LtU3J0?=
 =?us-ascii?Q?TocyybjxoLz4FIFZ1nIW2NU/OqalZ5qDgUyi+Cr36L1DJRu6X/SNDfVo4ERY?=
 =?us-ascii?Q?D/A7xzEpnLXsUtoKuA5cdc3rTFFCZCQegUVIVgIpESnM+WAo3ayYvFrO9Ldz?=
 =?us-ascii?Q?VOvA7XUSbb5I+aeJqdWoDOMVSnPAIosjDiGme2xtp5YxGQTIDOahZe45uJi5?=
 =?us-ascii?Q?Mbj88dPUCVOSYjs9u3NQcdPcOB9c9NnOAcr6SH8mhA5egTdcZZWS8zhYHIZN?=
 =?us-ascii?Q?BIwRYuncTbmjWNrf37XODgiSmIqhk2XqEHK/wPXjEbJBbwMHZuO4PU1gQ2Fm?=
 =?us-ascii?Q?mmqWXVoSa9fJsbgWlTJVR8oRJ9JmlI0yXRgU+2W6SZiPzKLHk/IH2apxXsPe?=
 =?us-ascii?Q?xsDCB2n6dob94b1jghDhC7vMaX2PuJK/WUNAm+4W9UuYsHFw3x7uzECA+BwS?=
 =?us-ascii?Q?I9zOKlBLiwZGIBz8s+YizvGDTm2oIvlrKpL5SBRO/hDsy57i9hjubTp3gGKl?=
 =?us-ascii?Q?enKvZbYxgIE0ExMXYUrtnbEmz+PFzUFynPSOdgZK0g3uLP3dkyASi2bBR9CQ?=
 =?us-ascii?Q?DryrG+MDMy7dN1tbpNNqlBH3ksyZZLS3yw5yC4RXqW1A3LWQv2XctXTHqYSM?=
 =?us-ascii?Q?3s3YaEQUXIJbKAjmF9c0n51dTB83hBZf5+Ulgkws0raNqRCucOHgE/mrt6DV?=
 =?us-ascii?Q?1fDGerG0XTcrKlXFJvsGAOgjSyoK9NmfXVEiLFie5Y4qEOViP7Z0/AumTqe8?=
 =?us-ascii?Q?izOYoMszZXuHoMBn89nH0oaN5saCCBWQTX6lq9wihTmf4MOxehr7PfofpFMN?=
 =?us-ascii?Q?YJHgBZJ15dloZ7jOIy36fhAn7J3Eovjw7NlpaOaZFW3O4CMkCgESB2R4VkRV?=
 =?us-ascii?Q?oaC3wp0NkMH9FHDMbdUlgXT6yRAnClbHoZtyvsv+xUnZk3ZhRCMhzgnSM4bY?=
 =?us-ascii?Q?joMLmX1aXSvMIB4/4V9e7H43SieUOltv1GEM+Bji+/r5BkiEHU2k8GDHRMtD?=
 =?us-ascii?Q?qJkrnaxzJ/siv1FJ25QVT/BCGsE8uaP9DsWKgqifP7SSAOJsK5NF?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e49528-6c2a-440e-f52f-08dee896461d
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:42:05.3064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BYd4nTZEaWVnWIEzFVKdqdSn/bnZbTHR2toj1oefrSXcrJj6SwLwgQSqRHRyI/K2HafpxE/ccE1BRCB8YLI4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

The IRQ-time DMA_LLP read can race the final internal LLP update and leave
the recorded boundary one entry short. No later DONE may arrive to report
that progress.

Before re-kicking a stopped channel, read LLP again. Legacy eDMA requires
STOPPED status and zero transfer size; native HDMA has a dedicated STOP
event. If the boundary advanced, consume the progress and refill the ring
before deciding whether another kick is needed.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - New patch.

 drivers/dma/dw-edma/dw-edma-core.c | 45 ++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index c6c2655c6c43..9489ca7e70fd 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -396,6 +396,47 @@ static bool dw_edma_ll_consume_progress(struct dw_edma_chan *chan)
 	return true;
 }
 
+static bool dw_edma_ll_has_hdma_stop_event(struct dw_edma_chan *chan)
+{
+	return chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE;
+}
+
+/*
+ * Must be called with vc.lock held. A DONE-time DMA_LLP sample may miss
+ * the final burst element. For the legacy interrupt interface, accept a
+ * fresh LLP sample only when status is STOPPED and transfer size is zero.
+ * Native HDMA reports STOP directly.
+ */
+static bool dw_edma_ll_reconcile_and_refill(struct dw_edma_chan *chan)
+{
+	u32 old_done;
+	int idx;
+
+	if (dw_edma_core_ch_status(chan) != DMA_COMPLETE)
+		return false;
+
+	/* Native HDMA reports STOP directly, without a transfer-size check. */
+	if (!dw_edma_ll_has_hdma_stop_event(chan) &&
+	    dw_edma_core_ch_transfer_size(chan) != 0)
+		return false;
+
+	idx = dw_edma_ll_recycle_idx(chan, dw_edma_core_ll_cur_idx(chan),
+				     true);
+	if (idx < 0)
+		return false;
+
+	if (!dw_edma_ll_advance(chan, idx, &old_done))
+		return false;
+
+	dw_edma_ll_irq_idx_discard(chan);
+	dw_edma_ll_clean_pending(chan, old_done);
+	dw_edma_start_transfer(chan);
+	chan->status = dw_edma_ll_pending(chan) ?
+		       EDMA_ST_BUSY : EDMA_ST_IDLE;
+
+	return true;
+}
+
 /* Must be called with vc.lock held. */
 static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 {
@@ -410,6 +451,10 @@ static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 	if (dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS)
 		return;
 
+	dw_edma_ll_reconcile_and_refill(chan);
+	if (!dw_edma_ll_pending(chan))
+		return;
+
 	dw_edma_core_ch_doorbell(chan);
 }
 
-- 
2.51.0


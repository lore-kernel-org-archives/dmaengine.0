Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021140.outbound.protection.outlook.com [52.101.125.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E1340F759;
	Thu, 23 Jul 2026 08:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796143; cv=fail; b=TGXyYMDTU20lln2FmKeurH4uEWSmQZWyj5iDcJQbkxNBA+0TzK2c2wfJWa1nNFIS3b7ma0odaxrbZWUBEUqwf9C4Aq5O38wlm7NvRzYEToluvJXwm2ZmFNfq/hL6/5Pkw5le3tIfjBQ4lYt3E7UVTeWa3ok4bDvaqkYclGgOpcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796143; c=relaxed/simple;
	bh=HuanX/6q7xpht99ArIdSSdq6yuSpUFW0m2ZYd5o8QM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pwUem/mYlIPebOGHgTWWuzf8H9r5j4aaUFb2I4XTx95uy9KpSQ+MDL/IFN+cqeAz/eU6B9aB7q48gZkDGbaVo/MhmmCf8AjiGVQ690AAt4DknLxjXglBaZLFiwSaH5xZv6sY2JGSydvOELIWAA4BSsZJvBh4cIiKcfpzehLYQXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=K+chDW4C; arc=fail smtp.client-ip=52.101.125.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="K+chDW4C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkCkKw3opSC/5nHUgqn1vb7thT/FsxQjb+egfM8xgXIF9jzHOLzPbD8SbT2f4Lxj35bhOn6wUuwBgbDm6CGPFqzIaXC3B2MOgZtmpFbsVMTEowy1Lp/cFvDJW7Tlhpd/mJ2bVAj0jO4RMxYhdMo6JnE4j8YvEq1YSjK2Ti5vQrpDZD5azljokDhNVX+aZ1d5qTq8rxja7dJrg3rJtYFOnTlHsTLSd39LT3pPzFkPDgVYdDKbjI3HqhcMuhB4RK5rMzC5f+6IbgXE4N5b8CSlWlM4GJSiQgYxv9jWEqAyM5UTwDXLR5AwrueHUrK6u6E1fprU5dLxyAht6l+PlnD1Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InS/BFXzw3Rdhua00piJtg3jaJzYFg/aQRVfXB3veEM=;
 b=Qk51/W1qYsHRrXNZmG1idmE8HJbJjRt65r3TU7rB+I047ZUwppVu6H1appCicDuStyhSdNDCcOMV/Ow17/1TAJdRHYN+rFQzgWp+afvhWdnEhiPP+1xUaABSAhDzrczKiLtHgu4wD9yPMC8J3cnMXATkx9NTwrOM1j73tzgOnNbepWj9V5Ivv4H6kiKk3wjBFW+dEvI2toNyHrhgA3ZiAW4wM/2WM3aKKSJpuQbOnb7Txcg77redD1pjOYkW4aH8lyR3c9JUlmCVt0KX833ewfSdIn1+guhy5gpjmJzE7h9j2/LmY9lAfuD9rSihoa2vgE7CAy7Zn5uPgd1Lhneyyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InS/BFXzw3Rdhua00piJtg3jaJzYFg/aQRVfXB3veEM=;
 b=K+chDW4Cc3+9U61cZ4hJXJl1eEj4O1m/UcNbXA4GQrSj1yQRaSytnFmoJS2Li96z6/+pUhC7bCYPGuuT+a6D9xPl6h6/InGPaMIVZuXNfHCZp1yiwm9kRjCI6h5Pjhc7N2UEwAMccJBTs6Y5JeQzBZUjtw6RJ7XZ3DdRwx+gbwI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:42:07 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:42:07 +0000
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
Subject: [PATCH v2 14/19] dmaengine: dw-edma: Reset LL state after terminate and abort
Date: Thu, 23 Jul 2026 17:41:45 +0900
Message-ID: <20260723084150.521366-15-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0096.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: ca765da7-39ad-44a3-01bb-08dee896479f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UfYwCKcrpawbmzJXO+uMnnnMUcJ9mKciNK0bAr5ekZId5OOzzmMUKqMEwvsPdQx/D+ZoH4zyE1FFedO5nyblDnlYsjYplvl+EISrxCaOEBUKnE5/z7OoMl26WlVmETc13STq5DQJLD0zyz7Cyps87d3Cd46kugJym+kbqvWFSqvwDNfNx0i6mv+KLAHYNCZkB/2ysYX/cT0UC1LmU7FYX+igYM/EUP2a3DAJFIKCvhW063mUukocIrLtYKskhVlho4AhS+RrbmgK4afzcjwDHz/9VQzz8YM4wSA+ZjXk5b4D+1ihuacMv9UTVXMWgL6R7ej+eW6oDq4SdL3a3ZR+cip6S92H+aTk9ofH4+/4veg3ZgEWwb40OwmKHD9bDSVx7Z2pEXRjoRcIy4Um7P6hR2BB9x4I3T9mNhaN0ZVvF991mFMzpvOHB85eBN2Iqjktux6NZqVFANiV+4ulfnHDm4d8HLp4gMHR2q234ugDTChyUDSzqUG/4vZvzFmjJRyTlODyV7eVy8Zoq3hHzRn4iWCIzqAlLYEmr3eX4HwjIfR+ewXCPvDthzxC1mJyegZE9SLDuA1G6CltktTmC15KBSgNOQMJ8zKQQr9OHUBCH6/JTQ8piEpSp2oyW+HDyOmEP7a3vCTHRdpFB9pJhRNYpKd4aIisIM3+XVwUqKziFB4s2wVo/KLiHzD8bz/Y5fYnrO1yw1qv0UvvCQ2CoinkzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kMXpt3qehHUJAxRI9Al2iUmbRt55Z9iXuMbXy9oiMOiNvc0IvzOrO8yXet2O?=
 =?us-ascii?Q?Am+DOKGs/rnCli+MAosPEoAbVKKqx9NWBgJzJXh9x6CJ9FlYhApRLExpwn10?=
 =?us-ascii?Q?xP5daqfCuQYTsKtWT85/A658zPmWQ1kAOUrBKZNaGoYnZWJ/L6lsWHHO70mV?=
 =?us-ascii?Q?rrYDYPcT2RruDBmnSr+QlzRonCM8bgQWQOwyffkNFR7pKEZdZH6CQyOBo3C5?=
 =?us-ascii?Q?fa1UVBGO36mvfNhWRLjnBRSATT4mKt4yRvBJQKCtIDnQV552iIbvCAIAyPhc?=
 =?us-ascii?Q?JjYYGUYbS4YV5ikfU8SUrXIRpQaNliwtVouWrEE9JkKfXs0zVfDkyIayIHVw?=
 =?us-ascii?Q?LQgh3cIRepOH0QpRhJ17fH6jN+sN88S9E79rrZRs3Px/l7IoTyPdfqpwUEEm?=
 =?us-ascii?Q?+2mhW8jy5K1qGG0I0HIkxUEKKU+Bmac6YJcVh7dRygYZKxW1te7KJNg/6u0E?=
 =?us-ascii?Q?bReIpKhk4s7kVQGfuVvUV8zLmSLvriDBzDLeQIeFisG/yPnZR6LLGBx1EY/g?=
 =?us-ascii?Q?eSbqT8KLHIx5tB3a3XTfbA9M0wNXOjBAwZYKpyu8hcWL+K/gmnzOHbKJKyY9?=
 =?us-ascii?Q?Ot2ugDNR3/JY6vofMwchc4xWDAzusacwQA1vWKgbuRDxCMdQLviUHVxpi+tC?=
 =?us-ascii?Q?faLGWgaxPfJ2vF7r9Y0inwJrpwyv9zRvf1Qg7nTsS9JozCYYjkIbHfkgmAJJ?=
 =?us-ascii?Q?C+IWZsa5iQr7a5dz9t9rlDLo5Ajm0KetaKi4JAzLrXnwl3/c2wFL9p1+k14A?=
 =?us-ascii?Q?mnSnMHgnblvMcGAhMYt0DlnO7nH+i0k1TKI3EHderNDWXxbYRejXbqaRKlz0?=
 =?us-ascii?Q?XSC79yf0VWCRXhL7p1mVw4mV5WpXzSwo9eZtFEbPH1i4D2AdRdiEjKT7Obpf?=
 =?us-ascii?Q?t9xpKImRTQRtJuTcYND/LWpado4xBK8aU38EBI+1sQLW5eFu/pAHUNK93buE?=
 =?us-ascii?Q?RoBTHLR9pTXVRXYOdfkiuPBjt6SXfUv84C3zH8kPdBbjRqXcTeQIGdHk8l9r?=
 =?us-ascii?Q?6/NH86UZebBizrbjEHBbUEthLhWF7q1Dgv6k6kh3QFnYhc0TzCptvGLYLnno?=
 =?us-ascii?Q?qNav+syN2ZNWMRggnCIdk7EcBpC/JXxuouJQYSlDhXYhqUSGwgLPReJbi5Ei?=
 =?us-ascii?Q?J2o6pfnnRBua3Jlxd1J6CqXOWKFID4K4t9e81U2kzI3850s0Cu9bX25ghVL1?=
 =?us-ascii?Q?W4dUYfyz4PqY5C6/XBgwHdtDgb5kjUlpPxH2EuR8dpXuH4ZnAdDUJ5mdbVYj?=
 =?us-ascii?Q?KWunwQEIkSmfh/WohAkgaGnVVp+dmFnwGDkGRG72vbEfeWW/1fImpqRs/LIC?=
 =?us-ascii?Q?YNkftvfD+PNURF/Pj2tAzZG+t7fjayXCSWOKkncpky9LFLcCQV2LpRWytQl4?=
 =?us-ascii?Q?pMkHZhEBmq/YQmXJzNZgN3x2f0xjxOH/f46UmejN8FNKRslAf3JPiorwtdYB?=
 =?us-ascii?Q?BqKj6uAySOrAuWPgM3+2llGSo7FfQ1jqHjmpJ+M59o0scY+o3633Ky20O7i3?=
 =?us-ascii?Q?pF6ohIVgRzINHXKb+2ByNuoEGpQwwt0vRZdxfoSUUJt8+nnpZ9JHxB1FxPmO?=
 =?us-ascii?Q?VHutb4XX3WWBvThEJ8mLtLoJ7JM/RKdNxA82UiOgXTRcDlEDlsJltjEdlKGA?=
 =?us-ascii?Q?PCka/eJd9BN63KAyerAbTlNXca5XqFMfNZPz6ukL1J3pIsqad9WrGmjUAmPp?=
 =?us-ascii?Q?nBgVwZKQ1zla+l737onzWvIpTEIWOX1B7GHXPuDgKHf+9GOJh5emFnqo5rr6?=
 =?us-ascii?Q?mFPkYYr5bbpkoCWI5AZ6Fn3j6GyRA51dpMvlx/onKdrWIAYTC/wb?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ca765da7-39ad-44a3-01bb-08dee896479f
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:42:07.8203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ntN5eZ2Pvhd1jMTPKkx9jM7zbeEUN5NZIWlOu7V3lN0HD2aqmU1ZJ27zBRQy+328VrLf0jtlLnYAuANkxLWXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

Termination and abort can leave published entries in the circular ring.
Reset such a ring before reuse, but leave an already clean ring alone.
This avoids clearing the whole ring after every synchronous transfer.

For eDMA LL, neither channel status nor an arbitrary DONE interrupt proves
that hardware stopped. Keep EDMA_REQ_STOP and EDMA_REQ_PAUSE pending while
entries remain. Accept a stopped IRQ sample that observed the request, or
one that immediately preceded it only if the sample drains the ring.
Native HDMA STOP and non-LL completion are unambiguous. An acknowledged
EDMA_ST_PAUSE is also safe to terminate.

When EDMA_REQ_STOP is acknowledged, terminate submitted and issued
descriptors without callbacks and reset the ring. Abort resets it as
well. Both paths leave the channel configured for reuse.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - Record whether a request was pending with each IRQ progress sample.
  - Gate eDMA LL cleanup on a stopped sample; accept an older sample only
    if it drains the ring.
  - Use immediate teardown for native HDMA's dedicated STOP event.
  - Reset only LL rings that still have published entries.
  - Preserve the channel configuration after termination, following the
    groundwork series' termination contract.

 drivers/dma/dw-edma/dw-edma-core.c | 96 ++++++++++++++++++++++--------
 drivers/dma/dw-edma/dw-edma-core.h |  4 +-
 2 files changed, 75 insertions(+), 25 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 963abecdc59e..9305137f85f6 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -71,6 +71,7 @@ static void dw_edma_ll_irq_idx_discard(struct dw_edma_chan *chan)
 {
 	chan->ll_irq_idx = -1;
 	chan->ll_irq_stopped = false;
+	chan->ll_irq_requested = false;
 }
 
 static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
@@ -616,36 +617,64 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 	return err;
 }
 
+/* Must be called with vc.lock held. */
+static bool dw_edma_may_be_active(struct dw_edma_chan *chan)
+{
+	if (chan->non_ll)
+		return dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS;
+
+	if (!dw_edma_ll_pending(chan))
+		return false;
+
+	/*
+	 * Legacy eDMA can report STOPPED while a doorbell-triggered start is
+	 * still pending. Native HDMA has a dedicated STOP event.
+	 */
+	return !dw_edma_ll_has_hdma_stop_event(chan) ||
+	       dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS;
+}
+
+/* Must be called with vc.lock held after the channel has stopped. */
+static void dw_edma_finish_termination(struct dw_edma_chan *chan)
+{
+	dw_edma_terminate_all_descs(chan);
+
+	/* Preserve a clean ring; resync only if entries remain published. */
+	if (!chan->non_ll && dw_edma_ll_pending(chan))
+		dw_edma_core_reset_ll(chan);
+
+	chan->request = EDMA_REQ_NONE;
+	chan->status = EDMA_ST_IDLE;
+}
+
 static int dw_edma_device_terminate_all(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
-	int err = 0;
 
 	guard(spinlock_irqsave)(&chan->vc.lock);
 
 	if (!chan->configured) {
 		dw_edma_terminate_all_descs(chan);
+		chan->request = EDMA_REQ_NONE;
 	} else if (chan->status == EDMA_ST_PAUSE) {
-		dw_edma_terminate_all_descs(chan);
-		chan->status = EDMA_ST_IDLE;
-	} else if (chan->status == EDMA_ST_IDLE) {
-		dw_edma_terminate_all_descs(chan);
-	} else if (dw_edma_core_ch_status(chan) == DMA_COMPLETE) {
+		/* A paused channel has already stopped. */
+		dw_edma_finish_termination(chan);
+	} else if (dw_edma_may_be_active(chan)) {
 		/*
-		 * The channel is in a false BUSY state, probably didn't
-		 * receive or lost an interrupt
+		 * Keep published entries intact until an IRQ sample confirms
+		 * that the channel stopped. An outstanding EDMA_REQ_PAUSE is
+		 * replaced by EDMA_REQ_STOP.
 		 */
-		dw_edma_terminate_all_descs(chan);
-		chan->status = EDMA_ST_IDLE;
-	} else if (chan->request > EDMA_REQ_PAUSE) {
-		err = -EPERM;
-	} else {
 		chan->request = EDMA_REQ_STOP;
+	} else {
+		/*
+		 * No LL entry is hardware-owned, or non-LL status confirms that
+		 * the one programmed burst is not running.
+		 */
+		dw_edma_finish_termination(chan);
 	}
-	if (chan->status == EDMA_ST_IDLE)
-		chan->request = EDMA_REQ_NONE;
 
-	return err;
+	return 0;
 }
 
 static void dw_edma_device_issue_pending(struct dma_chan *dchan)
@@ -965,17 +994,30 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 	bool active;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
-	if (chan->status == EDMA_ST_PAUSE) {
-		spin_unlock_irqrestore(&chan->vc.lock, flags);
-		return;
-	}
+	if (chan->status == EDMA_ST_PAUSE)
+		goto out;
+
+	/*
+	 * A stopped event sampled after the request can complete it directly.
+	 * If it was sampled just before the request, complete the request only
+	 * when its boundary drains all published entries. A running event only
+	 * advances LL progress.
+	 */
+	if (chan->request != EDMA_REQ_NONE && !chan->non_ll &&
+	    (!chan->ll_irq_stopped || !chan->ll_irq_requested)) {
+		bool stopped = chan->ll_irq_stopped;
 
-	if (!chan->non_ll)
 		dw_edma_ll_consume_progress(chan);
+		if (!stopped || dw_edma_ll_pending(chan))
+			goto out;
+	}
 
 	switch (chan->request) {
 	case EDMA_REQ_NONE:
 	case EDMA_REQ_PAUSE:
+		if (!chan->non_ll)
+			dw_edma_ll_consume_progress(chan);
+
 		vd = vchan_next_desc(&chan->vc);
 		if (vd && chan->non_ll) {
 			desc = vd2dw_edma_desc(vd);
@@ -988,6 +1030,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 		}
 
 		if (chan->request == EDMA_REQ_PAUSE) {
+			if (!chan->non_ll)
+				dw_edma_ll_irq_idx_discard(chan);
 			chan->request = EDMA_REQ_NONE;
 			chan->status = EDMA_ST_PAUSE;
 			break;
@@ -1002,14 +1046,14 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 		break;
 
 	case EDMA_REQ_STOP:
-		dw_edma_terminate_all_descs(chan);
-		chan->request = EDMA_REQ_NONE;
-		chan->status = EDMA_ST_IDLE;
+		dw_edma_finish_termination(chan);
 		break;
 
 	default:
 		break;
 	}
+
+out:
 	dw_edma_core_ch_maybe_doorbell(chan);
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
@@ -1047,6 +1091,8 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 		list_del(&vd->node);
 		vchan_cookie_complete(vd);
 	}
+	if (!chan->non_ll)
+		dw_edma_core_reset_ll(chan);
 	chan->request = EDMA_REQ_NONE;
 	chan->status = EDMA_ST_IDLE;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
@@ -1091,6 +1137,8 @@ static void dw_edma_record_irq_idx(struct dw_edma_chan *chan, bool stopped)
 			if (idx >= 0) {
 				chan->ll_irq_idx = idx;
 				chan->ll_irq_stopped = stopped;
+				chan->ll_irq_requested =
+					chan->request != EDMA_REQ_NONE;
 			}
 		}
 	}
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index d074506f63ed..d235046ccb90 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -97,10 +97,12 @@ struct dw_edma_chan {
 	 * exclusive convention used by ll_done. The sample and all later
 	 * accesses are serialized by vc.lock; -1 means consumed or invalid.
 	 * ll_irq_stopped records whether the same event found the channel
-	 * stopped.
+	 * stopped. ll_irq_requested records whether EDMA_REQ_STOP or
+	 * EDMA_REQ_PAUSE was already pending at sample time.
 	 */
 	int				ll_irq_idx;
 	bool				ll_irq_stopped;
+	bool				ll_irq_requested;
 
 	u32				ll_max;		/* Data entries */
 	struct dw_edma_region		ll_region;	/* Linked list */
-- 
2.51.0


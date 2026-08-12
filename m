Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020119.outbound.protection.outlook.com [52.101.229.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B702F47DF97;
	Wed, 12 Aug 2026 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550280; cv=fail; b=UEIe5NNqIzwDyScovq8/lkNwOc9QpxAD7jJy44o4x4i0/doD5g7xoVK77Nxk5Vw+bEj5S0z2iQy2II5hiKSFXuHhehvRyQHEMVzLyx00DEv/NI4kfGbq3qepUaTImW/GcBgHBK6dFVzqOkPugGjeDXQ0dT6mBgKOXNgAIuHgUo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550280; c=relaxed/simple;
	bh=zX7nk+IeidK6kLETDK68ddYIR8mCkOMhDrc6u4+ryJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m05fO9WhdegokMJESVq6jM8IY/o2GmU/dty4xv2O5PmR9stqcbLDYRXj96f+GcCPIdkbBGad8MvZBoOpUIxwiGd42tfr5oibNajRmN0W6HntTXOKI/lW+uDsuc6RSrg7lOMR9fWM4LLlzr9v0Mks2u337o0trRE4yfx+//RmgUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=bBJIn4bc; arc=fail smtp.client-ip=52.101.229.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="bBJIn4bc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVLgYvtQ/ZeeEIjHLUsfHuAysWG3v6BFiZ59nnN/MTHGxYGtR1+0/CepKu8pTN1036tH0n/tcHzcg11tv0ASDGdLXcFsXcVHV3dYo/ICbS3Wh5GUKX59pN8n6k2NtSIIjOPHTmcNep/FenHlEvxW1hH4/RuhZW6kXKKh+OtTrobo77rB/UGZ+aTBN5URFpfEqgLVcDj8U9ejUi29N+BrTS9I8/8r9LGcqY0UQ8qv1aftAVZBxFJf1Wk0T2f4y8APkWCVu5mPG5xUUrVTz7Dr6ded6iavdrFnDb/9rmCFsw+t1LfL2wWvYFfuEoQHPe4RamgtKyllznc9t80uLFYRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbNXVZAuGPKJ2cUXFDLR5scwcPmTDGfYCd2H2khzBeo=;
 b=Ii9APjzxOM8BMq2oGSRH8DC2uyS1YhaPX4F6rBguWW7h45cYSyJ0+ZYWXLV44CqHVURBA6V4giJiWsmtXdiLenOdGyCKszuigkoOvkVDQ5a6YZ0ObTFJgZgjymSHYtf2+LHCgZQEohMO155K1MJKPaIr55Nj0qaJBkXy7wKNkeMG3viYQJOjoyW2Xtej+iZh+63t3HIiZgEun3lsSwg6cuKR9IvOyR2bgg1kHQ1JiyIcHQqa6vc7cPfCc0oH8syWdb2rLhEERry4yzEOoRTCAhn88mWPSvkEfrHGR4tzs4Ag8Ry//3fBmmjxQZs5iiKswMSmM23sJB+QCbLo7RHV9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbNXVZAuGPKJ2cUXFDLR5scwcPmTDGfYCd2H2khzBeo=;
 b=bBJIn4bcwjobugb34+0e/tZ0EuuC0hkrisp+GR4TDCJ1zqFDTpLj2vaOUwbjZ5DOtQYxK1xu011JRnUBq1at9VFp5xWturmMdaDuXHKBSxXlHIzVVlqAvG+aFNWU4Wmq/sm6WvVtTUyhSE0bpQmi/HFrHEztyEQDAIz7tcp0gks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7115.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 15:57:38 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:38 +0000
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
Subject: [PATCH v5 15/24] dmaengine: dw-edma: Recheck stopped LL channels before restart
Date: Thu, 13 Aug 2026 00:57:12 +0900
Message-ID: <20260812155721.2807506-16-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0193.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: bf94577d-d565-406a-9d32-08def88a6ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|7416014|376014|1800799024|366016|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RK9dHn2xYJWOvZSMzNKCu3iuJJOp0R9HCp95rBchUuM5jh8yuZGnIy5rGv1fsCUPHH+u0OszZgIRA/2JOmGg/BV3mBJAGu07PXqooRMqSywwpL08wRrFd8ngQ92OeDbwSUYu3K01U1WwdE9P/GbDofpY+TZyeCeR29HkUdfTtn5Z4mYLfAACEK+QJHDjkMxDHkQUBYzwi5p+Qq2Ip23IvuN0LxVBkgfJN0IJbB8a2ULNVQVHtEDrzX3NMbKQVKKeKZ/6IXPfo8B8igmyAfmLiX6LR6nzLJOXQXZXnZ2EonMT+KKxRsXou8irVCBzvI8Wem+JU5akeiacDiIOvamoMjjaDu1f/Y286FQrbGz6LTjcgMHOP/eklruNSaoig1/eAKQ2yCAvQ4l5qmVjK2eGB4Syns2o2E0S239oOAdnMRkZLROYi0vnFho5rUm0RamHeCj5M0x7gCM+/er9zMW+NF7j8kQJASAn58G1WvTr0AafJxswnK4BF+yqAVm/4vBcfVKHLYz+nPtKbG+htrG+ym0bLo9lZ8DvqJGCQRswk4ROZxGS4CzuZUMYFih+2VGVo3NnrRJ2jwlgq+Jl+Mq5hbNAGk7/NC13EYVbh9iUqFKWR05qCDKi+vdJWMf2H+493lJxJ+ibAocyQghX0u/TJBSJDRzmLL7pYfeEXjwZiVbcg7OCob3sKFtFJpMUvzsOhElt53QpR0O0qUrVBokF/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(7416014)(376014)(1800799024)(366016)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0vYd5Jdeb0AOQsJHka6gttiCKhVbSw6kci5CviWWuFesgRlSA0qHbcaC3DKh?=
 =?us-ascii?Q?P61E8rx2A4jmWZm62vVr+mqtUpLJ2t7quXknVEkXeq5KFBNczop2KoiQFoXB?=
 =?us-ascii?Q?2fHUvVxXpFSg+siYS8UmGH41z7BvDMM5G0+S/E/nZaOU2A/qyjYT1Hqyf+Rt?=
 =?us-ascii?Q?NPu4f5Jc1gQEYw4JAnDdldUfpP9xc5wJMMcnS4sOTA6vO6zgPpDEKQHNZ2tF?=
 =?us-ascii?Q?DK7fkKpqbqFSfOdnR5sc/rdZE1Hk2kMUk5ndfrwAf7EUuYN1K6LbbAetob6K?=
 =?us-ascii?Q?fjgoRIX74E3ZOIsueywvDFJsF7ZLuXUaMIVdnf8zBLtK7HT4bJfY9AB91SXa?=
 =?us-ascii?Q?fG6oSHKFJPBl+9m6C+cGfVCno3bu+2MbyvAdirJJMZfwXoJqV7auwe7eIVps?=
 =?us-ascii?Q?0l8hBBOX3avvlhaq2hKlkleLd3WCIkJDknhcSlGm06bh5KVTuIL2f/3DiNOQ?=
 =?us-ascii?Q?4H8lciJtDy5TLu6oi5Yt4T14LQoQYALtXFeNVa6s2qCAm7//MftcNiXtOcQh?=
 =?us-ascii?Q?XJ+0fHIioBvE1PpDW/nxqJUuJxdniOxY6uZESJuoeawsjuxyaywR3PKqdj6Z?=
 =?us-ascii?Q?9EHyECoKENpKNzivvjv0T62yqmsSxvIbpjjtR/gilgNIUqSba+pkhLpT6CZI?=
 =?us-ascii?Q?keanW7LwOV20mu79S9n3YHF1UqsghWlmIiz0DTASb+vGu4eLrjI2RTS6RDN1?=
 =?us-ascii?Q?DDxHoSpi0HGSSiFhJskLDEwvtTIYdyw3RJ2gsauhZOeBy/Q7H8SVpl9jketk?=
 =?us-ascii?Q?sKBBya4w255XH+5OOJerrH17zB/9N4LOCMsp0Bv/61eW5RDqhxJydO7lWoMT?=
 =?us-ascii?Q?BJjLCOJuP68Ascn9PzVXMWBNfQtgWpNMd6TiG/MmsYp2Yq6lHr96R7KGZGd6?=
 =?us-ascii?Q?1d28h3n6ef2ggfwCVmJKpoNX7geMp4Ke7zdyVKOgqzXE5FcLzQQ8ETk9oXVB?=
 =?us-ascii?Q?7We4T9wVt1E3bwMOzkfWDWtzhvRqGg+2OpWL9Y4rugKSTq7anRf8Yj2+QkhB?=
 =?us-ascii?Q?AWUgks8CF7bnAIE1o07CHRqEdz68t3S6hdrkU4N1LbrgqXCPNAdo4xdTrhMk?=
 =?us-ascii?Q?cSd9Vjpb0tZ8vyx/jXxB1URM54WjiD0hG2jizVnxybty39pMP8PcyjCUuexe?=
 =?us-ascii?Q?xpC2W87tWIL5P98Xr/osd3Wi0z2o9lbOTD3S4cJi6XuPfCTPbkIE5jGdiyHC?=
 =?us-ascii?Q?heGuFb+nEmDS8M3CuRM7uzfftcaj/qmSMP4oMtYK8XS1oac2MKxET3uyfhDD?=
 =?us-ascii?Q?TvgkAY8JMgCPYFnj6oJyff2I1kzOk7sMajC8TIzl8RisLzOzRu0U1KFk4MKN?=
 =?us-ascii?Q?Genc6drdy7U9rtOXJ9DSiIxTq/V8UUygOXtzBmNJULLL9Bc+4T1ZoQy7z79d?=
 =?us-ascii?Q?wvjPZ0NksqDzgZ8LcSUrkZxqaJ2u2Jfbq8mqINA5ARvSda35zdZssvsx7l+5?=
 =?us-ascii?Q?bb6OQ6NGoyiovqx9FZhXdBM7YeBCcjkohW470EQOPc+wpUUsZnMprq0XAqcm?=
 =?us-ascii?Q?5OFLGKbWaFWjSKkAkyxgtdcIHbIAgKsm0ixxjGUNR8Ri53xL7OW0G5rPTFVg?=
 =?us-ascii?Q?0x2LzSPRilUHnEwtMzQ2DXlirazk6Ic2dINFEiCSCVY/Zar4+/ni5KEpBohJ?=
 =?us-ascii?Q?DxvB6yCJrCqyoEUUQGNeBYISFiy8VyVtGJY5oNP0+N6WreTl6c5J85q+nJMF?=
 =?us-ascii?Q?3OdsyPoXPxx/SL+0B9J761ntKh8jXWDaKtFB1t9ezKQ0zT4+TsBAIXNn7U7c?=
 =?us-ascii?Q?xhpYn4lBzxkHDfIyyIjMvRQnJw6ZFpbSA5CtiDg6lm0vKpvngzZ4?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: bf94577d-d565-406a-9d32-08def88a6ea7
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:37.9908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfpCxl4vDMaM+UMdrQaMsE1Q6XoGiVmG4WqiXhXb2cJK/fU0UH81R5jNWYaybbHpCyLTtzi9XExriAtPXb6YVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

A DMA_LLP sample taken for a DONE interrupt through the eDMA-compatible
interface can race with the final DMA_LLP update and leave the recorded
consumer boundary one entry short. If the channel stops there, no later
interrupt reports the missing progress.

Before restarting a stopped LL channel, sample DMA_LLP again and reclaim
any newly visible progress. If the channel still reports running, do not
ring another doorbell. It may stop at a CB mismatch just after the
status read, so schedule one delayed recheck. Also recheck after actually
kicking a stopped channel, in case no event reports the result of the kick.
Native HDMA reports STOP separately and does not need this recheck.

For eDMA, permit the initial kick after an LL reset, then only one restart
after each software-confirmed STOP boundary. Consume the permission with
the doorbell under the event lock. This prevents a newly asserted STOP from
being cleared before the hard IRQ records it.

Serialize the stopped-state check, LLP sample and interrupt-status clear
against IRQ capture. Do not reconcile a stopped boundary while ABORT is
pending. Keep stopped-boundary reconciliation separate from refilling so
STOP and PAUSE drain paths can consume it without publishing more entries.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - Read jiffies once for both the recheck-deadline comparison and the
    remaining-delay calculation. (Sashiko)
  - Gate eDMA kicks with a one-shot credit armed by LL reset or a
    software-confirmed STOP, preventing a later kick from clearing an
    unrecorded STOP status. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 225 +++++++++++++++++++++++++++--
 drivers/dma/dw-edma/dw-edma-core.h |   7 +
 2 files changed, 220 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 13c45549e08b..8325e296cb2a 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -27,6 +27,7 @@
 
 /* Empirically chosen progress interval. */
 #define DW_EDMA_LL_PROGRESS_INTERVAL	4
+#define DW_EDMA_LL_RECHECK_DELAY_MS		30
 
 static inline
 struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
@@ -112,6 +113,12 @@ static bool dw_edma_abort_is_pending(struct dw_edma_chan *chan)
 	return chan->abort_pending;
 }
 
+static bool dw_edma_ll_uses_restart_credit(struct dw_edma_chan *chan)
+{
+	return chan->dw->chip->mf == EDMA_MF_EDMA_LEGACY ||
+	       chan->dw->chip->mf == EDMA_MF_EDMA_UNROLL;
+}
+
 /* Must be called with vc.lock held. */
 static bool
 dw_edma_ll_snapshot_take(struct dw_edma_chan *chan,
@@ -148,10 +155,33 @@ static void dw_edma_ll_event_discard_locked(struct dw_edma_chan *chan)
 	dw_edma_ll_snapshot_discard_locked(chan);
 }
 
+/* Must be called with vc.lock held. */
+static void dw_edma_ll_recheck_cancel(struct dw_edma_chan *chan)
+{
+	chan->ll_recheck_at = 0;
+	cancel_delayed_work(&chan->ll_recheck_work);
+}
+
+/* Must be called with vc.lock held. */
+static void dw_edma_ll_recheck_schedule(struct dw_edma_chan *chan)
+{
+	unsigned long delay =
+		msecs_to_jiffies(DW_EDMA_LL_RECHECK_DELAY_MS);
+
+	if (unlikely(READ_ONCE(chan->dw->teardown)))
+		return;
+
+	/* Keep zero reserved for a cancelled recheck across jiffies wrap. */
+	chan->ll_recheck_at = jiffies + delay ?: 1;
+	mod_delayed_work(chan->dw->wq, &chan->ll_recheck_work, delay);
+}
+
 /* Must be called with vc.lock held. */
 static void
 dw_edma_set_request(struct dw_edma_chan *chan, enum dw_edma_request request)
 {
+	if (!chan->non_ll && chan->request != request)
+		dw_edma_ll_recheck_cancel(chan);
 	chan->request = request;
 }
 
@@ -184,6 +214,8 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 {
 	u32 i;
 
+	dw_edma_ll_recheck_cancel(chan);
+
 	chan->ll_head = 0;
 	chan->ll_done = 0;
 	/* Drop stale CB bits before reusing the circular LL ring. */
@@ -195,6 +227,8 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 			     chan->ll_region.paddr);
 
 	scoped_guard(spinlock_irqsave, dw_edma_event_lock(chan)) {
+		if (dw_edma_ll_uses_restart_credit(chan))
+			chan->ll_restart_armed = true;
 		dw_edma_ll_event_discard_locked(chan);
 	}
 	dw_edma_core_ch_enable(chan);
@@ -425,7 +459,7 @@ static bool dw_edma_ll_consume_progress(struct dw_edma_chan *chan, int idx)
 
 		if (WARN_ON_ONCE(desc->done_burst > desc->start_burst ||
 				 desc->start_burst > desc->nburst))
-			return advanced;
+			goto out;
 
 		/*
 		 * start_burst is the next burst to append. done_burst counts
@@ -444,7 +478,7 @@ static bool dw_edma_ll_consume_progress(struct dw_edma_chan *chan, int idx)
 			gap = dw_edma_core_get_ll_dist(chan, chan->ll_done,
 						       desc->ll_start);
 			if (gap > done)
-				return advanced;
+				goto out;
 
 			chan->ll_done = desc->ll_start;
 			done -= gap;
@@ -475,6 +509,10 @@ static bool dw_edma_ll_consume_progress(struct dw_edma_chan *chan, int idx)
 
 	WARN_ON_ONCE(done);
 
+out:
+	if (advanced)
+		dw_edma_ll_recheck_cancel(chan);
+
 	return advanced;
 }
 
@@ -518,6 +556,61 @@ dw_edma_ll_recycle_idx(struct dw_edma_chan *chan, int idx,
 	return idx == chan->ll_max ? chan->ll_max - 1 : idx - 1;
 }
 
+static bool dw_edma_ll_has_hdma_stop_event(struct dw_edma_chan *chan)
+{
+	return chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE;
+}
+
+/*
+ * Must be called with vc.lock held. A DONE-time DMA_LLP sample may miss
+ * the final burst element. For the eDMA-compatible interrupt interface,
+ * accept a fresh LLP sample only when status is STOPPED and transfer size
+ * is zero. Native HDMA reports STOP directly.
+ */
+static bool dw_edma_ll_reconcile_stopped(struct dw_edma_chan *chan)
+{
+	int idx;
+
+	scoped_guard(spinlock_irqsave, dw_edma_event_lock(chan)) {
+		if (dw_edma_abort_latch_locked(chan))
+			return false;
+
+		/*
+		 * Leave an IRQ-captured event to its worker. Otherwise pair the
+		 * stopped boundary with the status clear before another kick.
+		 */
+		if (chan->ll_irq.event != DW_EDMA_LL_EVENT_NONE ||
+		    dw_edma_core_ch_status(chan) != DMA_COMPLETE)
+			return false;
+
+		/* Native HDMA reports STOP without a transfer-size check. */
+		if (!dw_edma_ll_has_hdma_stop_event(chan) &&
+		    dw_edma_core_ch_transfer_size(chan) != 0)
+			return false;
+
+		idx = dw_edma_ll_recycle_idx(chan,
+					     dw_edma_core_ll_cur_idx(chan),
+					     DW_EDMA_LL_EVENT_STOP);
+		dw_edma_core_ll_irq_clear(chan);
+		if (dw_edma_ll_uses_restart_credit(chan))
+			chan->ll_restart_armed = true;
+	}
+
+	return dw_edma_ll_consume_progress(chan, idx);
+}
+
+static bool dw_edma_ll_reconcile_and_refill(struct dw_edma_chan *chan)
+{
+	if (!dw_edma_ll_reconcile_stopped(chan))
+		return false;
+
+	dw_edma_start_transfer(chan);
+	chan->status = dw_edma_ll_pending(chan) ?
+		       EDMA_ST_BUSY : EDMA_ST_IDLE;
+
+	return true;
+}
+
 static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
 {
 	/*
@@ -531,6 +624,15 @@ static void dw_edma_core_ll_sync(struct dw_edma_chan *chan)
 /* Must be called with vc.lock held for an LL channel. */
 static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 {
+	if (unlikely(READ_ONCE(chan->dw->teardown)))
+		return;
+
+	dw_edma_ll_recheck_cancel(chan);
+
+	/*
+	 * Complete the remote LL publication before serializing the new
+	 * hardware run with IRQ capture.
+	 */
 	dw_edma_core_ll_sync(chan);
 
 	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
@@ -545,18 +647,85 @@ static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 	if (chan->ll_irq.event != DW_EDMA_LL_EVENT_NONE)
 		return;
 
+	/* One confirmed stop permits one eDMA restart. */
+	if (dw_edma_ll_uses_restart_credit(chan)) {
+		if (!chan->ll_restart_armed)
+			return;
+		chan->ll_restart_armed = false;
+	}
+
 	dw_edma_ll_event_discard_locked(chan);
 	dw_edma_core_do_ch_doorbell(chan);
 }
 
-/* Must be called with vc.lock held. */
-static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
+/*
+ * Must be called with vc.lock held. Return true when published work is still
+ * running and may need one later stop recheck.
+ */
+static bool dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 {
 	if (chan->non_ll || chan->request != EDMA_REQ_NONE ||
-	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
-		return;
+	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan) ||
+	    dw_edma_abort_is_pending(chan))
+		return false;
+
+	/*
+	 * While running, both eDMA and HDMA consume newly published
+	 * elements without another doorbell.
+	 */
+	if (dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS)
+		return true;
+
+	dw_edma_ll_reconcile_and_refill(chan);
+	if (!dw_edma_ll_pending(chan))
+		return false;
 
 	dw_edma_core_ch_doorbell(chan);
+	if (!dw_edma_ll_has_hdma_stop_event(chan))
+		dw_edma_ll_recheck_schedule(chan);
+
+	return false;
+}
+
+/*
+ * eDMA may stop at a CB mismatch just after reporting RUNNING.
+ * Recheck once so the stopped tail is not left pending.
+ */
+static void
+dw_edma_core_ch_maybe_doorbell_or_recheck(struct dw_edma_chan *chan)
+{
+	if (dw_edma_core_ch_maybe_doorbell(chan) &&
+	    !dw_edma_ll_has_hdma_stop_event(chan))
+		dw_edma_ll_recheck_schedule(chan);
+}
+
+static void dw_edma_ll_recheck_work(struct work_struct *work)
+{
+	struct dw_edma_chan *chan =
+		container_of(to_delayed_work(work), struct dw_edma_chan,
+			     ll_recheck_work);
+	unsigned long delay, now;
+
+	guard(spinlock_irqsave)(&chan->vc.lock);
+
+	if (unlikely(READ_ONCE(chan->dw->teardown))) {
+		chan->ll_recheck_at = 0;
+		return;
+	}
+
+	if (!chan->ll_recheck_at)
+		return;
+
+	now = jiffies;
+	if (time_before(now, chan->ll_recheck_at)) {
+		delay = chan->ll_recheck_at - now;
+		mod_delayed_work(chan->dw->wq, &chan->ll_recheck_work, delay);
+		return;
+	}
+
+	chan->ll_recheck_at = 0;
+	if (chan->request == EDMA_REQ_NONE)
+		dw_edma_core_ch_maybe_doorbell(chan);
 }
 
 static void dw_edma_device_caps(struct dma_chan *dchan,
@@ -684,7 +853,7 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 		chan->status = EDMA_ST_BUSY;
 		if (!dw_edma_start_transfer(chan))
 			chan->status = EDMA_ST_IDLE;
-		dw_edma_core_ch_maybe_doorbell(chan);
+		dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
 	}
 
 	return err;
@@ -734,7 +903,7 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 			dw_edma_ll_snapshot_discard(chan);
 		chan->status = EDMA_ST_BUSY;
 		dw_edma_start_transfer(chan);
-		dw_edma_core_ch_maybe_doorbell(chan);
+		dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
 	}
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
@@ -1084,7 +1253,7 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
 	}
 
 out:
-	dw_edma_core_ch_maybe_doorbell(chan);
+	dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
 }
 
 static bool dw_edma_abort_interrupt(struct dw_edma_chan *chan)
@@ -1123,6 +1292,11 @@ static void dw_edma_irq_work(struct work_struct *work)
 						 irq_work);
 	unsigned int events;
 
+	if (unlikely(READ_ONCE(chan->dw->teardown))) {
+		atomic_set(&chan->irq_pending, 0);
+		return;
+	}
+
 	do {
 		events = atomic_xchg(&chan->irq_pending, 0);
 
@@ -1140,6 +1314,9 @@ static void dw_edma_irq_work(struct work_struct *work)
 static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
 				   unsigned int events)
 {
+	if (unlikely(READ_ONCE(chan->dw->teardown)))
+		return;
+
 	atomic_or(events, &chan->irq_pending);
 	queue_work(chan->dw->wq, &chan->irq_work);
 }
@@ -1189,6 +1366,9 @@ static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
 		if (chan->ll_irq.event != DW_EDMA_LL_EVENT_STOP ||
 		    snapshot.event == DW_EDMA_LL_EVENT_STOP)
 			chan->ll_irq = snapshot;
+		if (dw_edma_ll_uses_restart_credit(chan))
+			chan->ll_restart_armed =
+				chan->ll_irq.event == DW_EDMA_LL_EVENT_STOP;
 		pending |= DW_EDMA_DEFERRED_LL;
 	}
 
@@ -1378,6 +1558,9 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 
 	dw_edma_wait_termination(dchan);
+	scoped_guard(spinlock_irqsave, &chan->vc.lock)
+		dw_edma_ll_recheck_cancel(chan);
+	cancel_delayed_work_sync(&chan->ll_recheck_work);
 	cancel_work_sync(&chan->irq_work);
 	atomic_set(&chan->irq_pending, 0);
 	dw_edma_irq_events_discard(chan);
@@ -1431,6 +1614,8 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan->status = EDMA_ST_IDLE;
 		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
 		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
+		INIT_DELAYED_WORK(&chan->ll_recheck_work,
+				  dw_edma_ll_recheck_work);
 		atomic_set(&chan->irq_pending, 0);
 		chan->ll_irq.idx = -1;
 		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
@@ -1786,23 +1971,39 @@ int dw_edma_remove(struct dw_edma_chip *chip)
 	if (!dw)
 		return -ENODEV;
 
+	/*
+	 * Stop new clients and asynchronous hardware access before dismantling
+	 * their execution context.
+	 */
+	WRITE_ONCE(dw->teardown, true);
+	dma_async_device_unregister(&dw->dma);
+
+	/*
+	 * Drain channel work that may have passed the teardown gate before
+	 * stopping the hardware. IRQ handlers remain installed while it is
+	 * active.
+	 */
+	for (i = 0; i < dw->wr_ch_cnt + dw->rd_ch_cnt; i++) {
+		disable_delayed_work_sync(&dw->chan[i].ll_recheck_work);
+		cancel_work_sync(&dw->chan[i].irq_work);
+	}
+
 	if (chip->flags & DW_EDMA_CHIP_PARTIAL)
 		err = dw_edma_core_quiesce(dw);
 	else
 		dw_edma_core_off(dw);
 
-	/* Free irqs */
+	/* No new hardware event can be raised after the quiesce. */
 	for (i = (dw->nr_irqs - 1); i >= 0; i--)
 		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
 	dw_edma_emul_irq_free(dw);
 
+	/* Drain IRQ work queued by a handler that raced with the gate. */
 	for (i = 0; i < dw->wr_ch_cnt + dw->rd_ch_cnt; i++)
 		cancel_work_sync(&dw->chan[i].irq_work);
 
 	destroy_workqueue(dw->wq);
 
-	/* Deregister eDMA device */
-	dma_async_device_unregister(&dw->dma);
 	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
 				 vc.chan.device_node) {
 		tasklet_kill(&chan->vc.task);
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 27cab6ca5e67..aaaee312e973 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -120,10 +120,15 @@ struct dw_edma_chan {
 	struct dw_edma_ll_snapshot	ll_irq;
 	/* ABORT is terminal and remains pending across LL state changes. */
 	bool				abort_pending;
+	/* One-shot eDMA restart credit, protected by event_lock. */
+	bool				ll_restart_armed;
 	/* Native HDMA lock storage. */
 	spinlock_t			event_lock_per_chan;
 	spinlock_t			*event_lock;	/* Selected event lock */
 
+	struct delayed_work		ll_recheck_work;
+	unsigned long			ll_recheck_at;
+
 	u32				ll_max;		/* Data entries */
 	struct dw_edma_region		ll_region;	/* Linked list */
 	bool				ll_valid;	/* LL context programmed */
@@ -172,6 +177,8 @@ struct dw_edma {
 	 */
 	struct workqueue_struct		*wq;
 
+	bool				teardown;	/* Gate asynchronous hardware access */
+
 	raw_spinlock_t			lock;		/* Protect v0 shared registers */
 	/* Per-direction lock storage for the eDMA interrupt registers. */
 	spinlock_t			event_lock_per_dir[2];
-- 
2.51.0


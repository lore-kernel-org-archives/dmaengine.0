Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021072.outbound.protection.outlook.com [40.107.74.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BC0432316;
	Mon, 27 Jul 2026 17:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171828; cv=fail; b=SPAKwpsdC5q+TjyZeVDA1UQR9y8/c/07ZUVnwlDMQWK3GvXATy0dOULnLAYJONoiwZd/0OfYUFsqsnTO4Tmzcw+ooeIv7x+tZE+xZF/iu5Twc7SCbB7GF0V+FJg8YKwebxv+oehotHsVeMaUQzpK9RWyRb8Y4u3SyCdBFhWDraQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171828; c=relaxed/simple;
	bh=U4J6GKE0I6UlCgpQcMRTyajh/XnSt9oELCOaNmilytI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=keVhcwWw4nYRxqJ2G4Z4vDQn/HXlUECgXOudK879ouVknxAv3EOHNVLwwQLNgg12vlOTMm/fDdpVHo+9KamEfJIW7y9NrXvlU9dO6DKmSr5iRHxplmOI1f1gMfrqA6KcpUIDU+VeoWpnI/bqletCz0TwLHsfPN/X1Yxz46rca10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=uHUDxhsp; arc=fail smtp.client-ip=40.107.74.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="uHUDxhsp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVke5Ednsy87uQAv5AjBlmJ+u34UEp8a6u5Sj6vPpkbqI6V8kxllc4kY+tn5rpmZSgJSesCPLS+mpLsaHI9tqDyes3TvLKu7TBSlpnTaYQIDtwADbv4ZzxfNrgOSueUrPzj0r9fly1NHPkj6Jicw1Y+DWk7PRRpAzNrEECQ71upz1Ik5SY9glgUZowmRFkeu0SunkuPhJ9u816cXydVJfewDE68zZPfZMZeJOA3k7lCby255PVtcnOTAf1BOvxpRcAppqHjjzBUg15y+FO4B5W5WoXBnXBUcSee85+1+qdMH9FFrQdIEmMr/hVnCPW8ByIMRXjF0yXdZbU5tGKUYyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3S1MXZyoyL8ypapisRPNWX4DyeEs2apFSDa181lvcg=;
 b=Q2z5qDey/qZUylnWw4iUcJ1lcIk40T5JarqoQmVuWDcVJLYASLwIxnXpPgWQYnB6YUGZ9GRSHQ1ewR+uDwZYhRL/veA58pmOpR75Kn1m4WYYYGhDjFJp24Pv48kpXVBTsmIbFJQOHYp3EVDKyU70s7z6CEnfNKjHnPglMLuh35BZv4EbFaZSRtW1G/S6Ufnab0ma9FqZy8cKPe1AxsvdzTjXdj1LvYoAVWKKoxrLGMPluDLuLedWPWtff7/D3BjQyiCxrIEwkFhZBIDdIsISAyi/QalPlPGDt70BVlJwL5yb3MVU8B9Mq29mgJMbXKc2kn/kwkZB4qs9KbZs88JIHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3S1MXZyoyL8ypapisRPNWX4DyeEs2apFSDa181lvcg=;
 b=uHUDxhspRwQ3MvDYr5NboEMTIAijc8KpoGGNyV2F5aoPA1xtROmLv/KjgiDdQ7oSMi08MJQCw7qX1bBo80gaO2Zfbdmy7a702Vd2WtjAecrnkGas0CaQXr3/zMbW4vLfsMJc+NLwHBGnSSihUYQhAuc7W/xCZVq8gvY3HmYrLDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:39 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:39 +0000
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
Subject: [PATCH v3 10/24] dmaengine: dw-edma: Prepare LL kicks for event serialization
Date: Tue, 28 Jul 2026 02:03:09 +0900
Message-ID: <20260727170323.2321369-11-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0027.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: ef0ba54d-cc75-49e4-9508-08deec010128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	Mu0sO3tvLl2HBBSu0o2XXYilSTgD0mjRSX1nfK5GuhahaLb3Fxmgeu4xoWmV5A8oPwKNd6pa05tAN9Rz7h40JPI21ftKGJFXaHeMg3CvAeWPawQRxvhvdtvk8XP9XuERpZW+SoKMFdzR34D4FX8ROKKecNCVF6tHFBt4KmieE0tUkRT6NeC5u8JcsPt7Gch0+h6rlBDqp3gChup9bfjm4UVbFN62TNEIZpXO3RXxbVofmNjv+raX/g5LVmwIUWkBbCvFZDii7gWeCXniLj8SsXMTWN07MY2+41vjvvCCOosy3D0sh8W82aU2ivQQrDcohDCLpnPx4K+XGh904pjg2VKbxe1pYGH2QnRdg2PIo+lKT65rnvyN5wtTAQ71sbuO9X4iQ+rxLx+5GtpLSdNHbYKbnEGL2Abh75stblHRiMT7G1b3rp3EFWe+Z7bajBZCpmBKm4sDjpTNzyGWqoYp3SrDoCEl4au4uN6IPMiZvpNXL5/HvfChG2T3pST1SG13JHjblF6MVWWKXfknUJaW0j0vZWqMxSJx2Iap6C4+jbGFGI1wTCITjlMwCYUcxWL9MtNeJpGX3Ym/MXIaDOOzy1r3P+5bKG6zL7qcXqYU/dVZOz1BBMwbV0+GcHbfU6agrIZI340SBeScf79mhu6/cYYEMG6c+ROUmelonbycbSxv6VRe6rnmr1ciebe4c+2H+8QIXRU7Lfj/Xba3GcI10A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FTvhBx3z8kH1WIyKJWJ0YhXw1TRrbmKnw3Kylqs9SwjWndYxJvHTfMvskKcO?=
 =?us-ascii?Q?QPPn+2xyLFnS4EDWv97spDHqMeySpmJvsi3Ob5L08vqba7k6igzgQm419lIW?=
 =?us-ascii?Q?SgGmOj8nBA+ZkqC2uBhk/Qq7ioD16o3y/aWg/pOfjinHwxR9kXuPgqtf6y48?=
 =?us-ascii?Q?HPcMx2e8tFGuWcLPAqphIZSyvadAyGRRvU6gQJflNXmEzQlTQhB1vprM3UMv?=
 =?us-ascii?Q?IZ7W5nvH/GWSDLU39WPmevu7MPylM12oMbxacf6Nl4mtnajnUFROC733mFJz?=
 =?us-ascii?Q?UiPEw0ehaCgWLRkl9VYRA9CMdzL3zYeoEs/ZgzG/l3jbEPTbSgj+CoaaNJLP?=
 =?us-ascii?Q?o6on0OiXRSKykqT6uCvdXiupLJ7ahEuib4lW0j4EQJxzbY5f/2TeZV4QgSV8?=
 =?us-ascii?Q?N0NvuEy2jsbSPoTjaZwKX2CBCe+gjcRveAJKDbmSknQ1Hj9S199TEpV44QJV?=
 =?us-ascii?Q?lVS25N1hjc59z+FH94RTcp68h7ZftJ/Ie+9UtMx43g80pOTX07oznfr5UjkU?=
 =?us-ascii?Q?lPNv1Ka4TpENXJA4gQQGCOCevmUi6az11neTdv6M9H+WnQWQte3MlRuPOGhu?=
 =?us-ascii?Q?eEcapv5lK87DYwObC+/PiUSmghNLjYRUdwCj0nRW/kTNGuyqlKg3VSvuuT9R?=
 =?us-ascii?Q?kWLKzwHlrtZ8+imXdVVmm1GrUdsFRo5DeeU36+ojshbB50Nx11cykAORAEZP?=
 =?us-ascii?Q?r/GN2M7BB6lU++YnfJezaoLvcrpDOalvGY+LhJHhiGmVDOiUJtvhzCFHiHsZ?=
 =?us-ascii?Q?An55CDbgje7GZj6Kvsck4KwBWUTuT4S/hIrqMsB2WoSVX7HxYV6IfWImAK6b?=
 =?us-ascii?Q?eGSkNsezPAZlDCo2VhQ8uTi2NMm83DI456fSepOvQSfJyRWqqzs4/QOR4x5i?=
 =?us-ascii?Q?4C3ep7YF1CUKV5sgoO7oImgvsO1RkZi22fx5cgIRytSIotD8gOzv6fh9Ef3B?=
 =?us-ascii?Q?8KeAnfBbALmphQeCY2XEX8QQnBtAinGBHMce4ww/xwWh2KLeB05mAUv+Ae9S?=
 =?us-ascii?Q?2zU/UcMSXAj9/pJe9YhFBIgnn0Vv93xFPpta8ufjBDgBiWSoS7Vc6DB25HSX?=
 =?us-ascii?Q?kwsuRZjLPUt7xz4kFrDczeZCogaJqeww4M0TD5Fvxjsh4laRIhG2YX43BAH0?=
 =?us-ascii?Q?CPC+kmsgjLkcNxZprE/8Z+BM5UyEtpDrjdN15db/dOhHt201dPujKX1cvGJH?=
 =?us-ascii?Q?kdL5IZnmwPkLc9VZQbsdyd7PZgVsnGar9AuC/Uq3UBGea+XpQAKTppI6B9H+?=
 =?us-ascii?Q?voesFu6A0t9bXYl6rTkkETYDmk3cyAYll9j/5BMrjOb18mblfqsC5w7kfPrc?=
 =?us-ascii?Q?bA8UjnT+Az0qtHtIeRhJhNJmtnaXFPyy6O6/zKRIZsUrPXUY08+pq1snBLqz?=
 =?us-ascii?Q?6pstwxhF7cEfhA40Dw0e9VXtDmcVeFHKzl3nE28pUSt9P6xvZSj0eXsKZ/i9?=
 =?us-ascii?Q?peMtaedxrEIPM1fRdStpDJIKUsGtDZYS2CNtpWYzMY223Fcf8eCcIg94j3AV?=
 =?us-ascii?Q?zLhJk8bpgq7mU5YEAyZVufy1FcR7TAPp+RuNVe4EvIfUUdNWTAEnU1h4EwjV?=
 =?us-ascii?Q?2cIRaE8k2NNOLX7FmcP7A7MM49W6e2awSIzdJa9XkVFikffcc3QdCfLoVe8L?=
 =?us-ascii?Q?OUZTtFLBShHXG43SZUtXi+phfVdN1M9uvsFRAhI/IRLB1hVcJ1aUTBk4aAix?=
 =?us-ascii?Q?oNQFKPtJ+kweE99H4THMj0k+wSwM6ne5y02/JQyS/n8+RFff8z0mHyUT15Kt?=
 =?us-ascii?Q?sDKFQKu4lRmLp3a743tiuta3A1h9lImrLTpd66OBonYOZrsQyZ7a?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0ba54d-cc75-49e4-9508-08deec010128
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:39.2439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0D0gqU3lGCi9livz8I1bx+Qw7K1Og/XgIWltlnnkwM549V2KGDIHOAirZXzgl/UnlmfVwrkhWLiBjmeVcPI0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

Both eDMA and HDMA perform the same remote LL read-back immediately
before writing the doorbell register.

A later patch serializes each LL doorbell write against IRQ event
capture with a raw spinlock. Keeping the read-back in the provider
callback would hold that lock across a remote read. Move the common
read-back into a core kick helper, where it can run before the
serialized section, and leave dw_edma_core_ch_maybe_doorbell() to decide
whether a kick is needed.

No functional change.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - New prep patch split from "Centralize LL doorbell decisions" to keep
    that policy change focused and the remote LL read-back outside the
    event lock added later. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c    | 20 +++++++++++++++++++-
 drivers/dma/dw-edma/dw-edma-v0-core.c | 16 ----------------
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 16 ----------------
 3 files changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index bb57f2d39d1c..e3d0559206d8 100644
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
+static void dw_edma_core_ch_kick(struct dw_edma_chan *chan)
+{
+	dw_edma_core_ll_sync(chan);
+	dw_edma_core_ch_doorbell(chan);
+}
+
 /* Must be called with vc.lock held. */
 static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 {
@@ -261,7 +279,7 @@ static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
 		return;
 
-	dw_edma_core_ch_doorbell(chan);
+	dw_edma_core_ch_kick(chan);
 }
 
 static void dw_edma_device_caps(struct dma_chan *dchan,
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index d883ca446f5a..b3098eb83442 100644
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
index afc2f24fecd3..64a07fbc5be3 100644
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


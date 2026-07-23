Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020109.outbound.protection.outlook.com [52.101.228.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FAA3F4DD7;
	Thu, 23 Jul 2026 08:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796122; cv=fail; b=nv/5dfsa0zXORISOi9+R8i9uaTJ7kdS3n5HJW02mY3n1xrE+XwXRp6xfs6JgF3pNAHH/sPwcwurM4FNCQC6b7ehlSiCCRtcjVLuyHGWewMBvHOQHYhEBivB4/+kZmJbLIF/dLMxBpknr779I5dKKe42UkBMG5xg4bQwJlbH6Oy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796122; c=relaxed/simple;
	bh=MOLQbibpMEhSzoWPedUEy6XFLazFzKK+hatyWJ+W194=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zonn1pevIY/hiItMaQ309IeIbiENWv2oF5AztvL5pqj/ciq9cAfgUddQ0xeqe9D21tRPxEvwQU51Y8iHUB3qhBfy61Ja1XVtPr+qbKTvLYvORcGxHXnmSnvAAijBoE3mw/Hg8LE9mX0foItRhLzRmoe5vqyeXEKoARgM5Aid8yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=UBJTGA46; arc=fail smtp.client-ip=52.101.228.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="UBJTGA46"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsBmANflStifkjmtld1F2Lj5Vs73r0XwMskx3WnIDBjpiGhrBr26XQacffX5xY9vK0lE461CFYfzIfurlCgF2gBb3FaLb/hlOj39k/GI+OubwXbF6gKxMpqaLiS94xIOO7f4+XI2ULE3tLOgQbEVLUd6+cAgkb3xIjRNVEC0CjRKbdOLYJLDN9luqxxwfZu02hLT1lV1Qo9Cz5g/qeoW1YalD4Yl/148SPdX3EbMK1YAo5wgKyIie6lN8eoueR4mfeEXcF7hN1p3/OnzpnI+6TnsPgUonSZx6Y/o2mS5G/125VjEwosgT+lkKwDELwk0rCPv6Pvwrnj/MHMJ8ByMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//JkqIeeFYnmiWgfTENnetfapvi2kEjhWPjAZqcS9Cw=;
 b=soPhg+5PbYO/DkdzP5DuKLCBHh6hwnfRsASq79rMWGzDY7pg9k9I1i+xc/k4DJXyV6lgQ/Oezp25l0Ju1eurWHd8XKejEDtYYU8wH8sn+7VYcrIV/YKmBR9xDN1whs6vAsLzMMkWHuR/7sxn+Gp9pqOkvDvwkdzzGprKIf95D1zeICX7Wojjby/Nh5oSERS7O3fpvRZ5fOaWVrGouvIztAwRuNQ1ktzKUY1tK/phZsgHZLXFR0djxJlRD+MU1VaPkfcsxXeF1p7pe0jFdElsEgy99C1ggZZMOQhqvmNRJqPDq76RpW3U6GkbpxHA8/abNTISzgdESg5Tti8/H0vJXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//JkqIeeFYnmiWgfTENnetfapvi2kEjhWPjAZqcS9Cw=;
 b=UBJTGA46NAgtfgiibU0/E3UMAbVuChmHYwy0FnmwZzTna8pNEDJ0DWKlTPALymSEEEFWfP51LlEMdXz4dhArlYu/qyXEzg7W3Fwci1Vt2nEl6nXXhpM3yG4s06WM42F+iNLY1bjmfCiLfiL6+ZmdgXNkVGXIqgpTFAUf+cW54jk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:41:57 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:41:56 +0000
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
Subject: [PATCH v2 01/19] dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL entry index
Date: Thu, 23 Jul 2026 17:41:32 +0900
Message-ID: <20260723084150.521366-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::16) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: c5eeab45-42bf-44f1-8e76-08dee8964121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C7nJUvWtPPigrW1+OzGfoE58NiIqwy7WUNHr82y1NBODwkeey+so3UMJlWs5JipiL4utkDY5+0/dHeLje9bKAM9IUptQlKb55qqIRA5BxAEyRSp7n7fa0lEuG2E4hpW8VRNYrohuZ7+dXYTfR21Q9jVFgRJY9ib/lA/CmaTQVFXRNmdpp1i+dX39vXKyug2yxZ7yCCQCLO+A7IXOnL5z9x4fdpHPjUu0nyCcDMBvUWmiORu3hUYIDVfRvxuH4uL5GnqEMILjcvusMX5JSP0nGCYOshKEhXdV08P8O6+y61VKqBR+zh+AmeH+/0Z1wBakQhwP5BFiFmaIxmaC/AlfYZRVxmuYVDxNR5y8q9j82Tmr3jAuVqPC5bMdNRRZUQX9zurQ/F94sH0n9sDfTF7Jk79jxI50Rbe63D7xtV/sXMBb4gNDaulXFo9QZpLTddAX/XcAsVQW3mnw5tjENRUku2BTrKmEo4fVpNBK2mbDjkQKDXO9ON8GMTNVAOTDXxsedsLvM8lf2a78o7MLvB5zJHBL2qBZMzqLxzL451OSG9wzCEO3GZcCq1EiwMMJWkXZqMpqMTOHppgT9QFDIOTXb8NmByQVGUKawG/xTbfWUsgmw0AujwKUkM+AFsNpYbyRy/6iv78uli0sH9D+OggKE/b6XaO0aPD7ZzgFb2jkXJTVDbsI25OHEWNm4tvH3KXNPe6DLITQjkmYlEu2iP6XxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kV7jIZUmXyrSfy9Myzcm60dZbaCcNUXXO18U2gw9PG3BoFI8wYj6rfUEtBhS?=
 =?us-ascii?Q?7J+UyVKQbSWhv7+/lUF/7dqbVJ+MhZW3Q4H6Claq5J6Ell/ARik2r+mD3Afv?=
 =?us-ascii?Q?4mw8mPpXrM8VGdGbcB1CX0NfNF9p7u5FFdlPSkTsZFnwJTs2O1pijP8Ku+xu?=
 =?us-ascii?Q?O0pJf+/11BswMmdQYv3FLToPVa7AJlfC+1UlCFsR/DxjKw8VCQKmTW6pgm6+?=
 =?us-ascii?Q?9+NrNHmqZYkY05oammhUXhz7Wjm8RIFaUBL7UlTnrdCWbPj/csLpTxnxJmnr?=
 =?us-ascii?Q?VRK4TN2/LIbmwjzn2Otl0AfJHFcqldt8O4Nn1gQCXVOv/yiGT/mqlvqIBI8w?=
 =?us-ascii?Q?YeIJIwb0rTEh720W+DwQsLJhdFlT87M+5OxmAlOjxO82CTR0pAQx+/AK84lR?=
 =?us-ascii?Q?kv78Fi4Sevgd38G//psuV1guKyLUfGl8FUw3A3DUQthuutIm8X8gVHVwWuup?=
 =?us-ascii?Q?dOhs7y928QFZdx0La7Xp6Tm2iKz0mwM7oIVFnHaygec5Zxa1ygYAmGPK7+Ol?=
 =?us-ascii?Q?B13h7pP0ux+NKuYYp39hYLeCvY9M6l6BxJcu9mBMnsL6KK7gUBG6uhmXwD90?=
 =?us-ascii?Q?PF/UttReMZAU/lX8iVucvoEJgvkw9m7p0nRfa2g8AhogR+29Y2unmCouBdrC?=
 =?us-ascii?Q?IoBtOrnAKjkypIfi1XbzwBWlp583fFZjVdb2lxlHWib5MpBjB5XMHjSW6pWe?=
 =?us-ascii?Q?ncBkS7zyA4NaSkK3Jk2j4TdG/9oH9/BFe7o+20L+yaGTpCztusmMVEQoGlRF?=
 =?us-ascii?Q?ZofzcJBgUKsz5jvZ+5xFpz7AqdK000J+BTdKS19Fk83//uoTDYm9Ujl2qdLZ?=
 =?us-ascii?Q?UDp30+gE2Mt3tJJ+34ufCrobhk0mHU6yA+g1jC+cS1eNFHSCL7GohUk5okiT?=
 =?us-ascii?Q?ooeIwqwDvRta1VOuqpcMRKnEcM1fnUFhwjIOwq1EHz3rWrDpZijFgJwYo8Ga?=
 =?us-ascii?Q?I4JNRsoaJcqutxDib+9xAxbMGI+3CcJAPlcnRCSYWtZmsF08xG0aOFvBx9k5?=
 =?us-ascii?Q?WnKEyMVX8P4PajUFZkEF7RalWJcl6V6RKEIq6XqnJ7bRIKtbkGOGgNm2fBkj?=
 =?us-ascii?Q?QoSpYcW5WO+c/UUVijCl8tbW/MuxkbspoCgwjVJyRn6IKcbELQrliUVtkEp3?=
 =?us-ascii?Q?f6nl2HaIyc0Swv68fDR/9Ho2LFQxJ5P53hbdogMsqHw2fY0/sicMCW0Pew96?=
 =?us-ascii?Q?MGj3YHO1x0zWmm9xBHn385iECaGN9c35vz+GabE5w2BHApXitfyzHHKJ4MgF?=
 =?us-ascii?Q?CsheNFoEhtlb6Erc3LOcUDD2EZx0qWBu46KtGO4wF7Zu8/4Lytqy0tVzEggR?=
 =?us-ascii?Q?JOEdSgIZ/zFu3u2tO/Ry/zyrU9akZLeCf2pMLdFWle+ZRb0Uv7mb7Ypo6J4q?=
 =?us-ascii?Q?4i6JgF5GG4DIjSK3XJJfSvIsNxBYUOwr1SC/SruMqycrGSXmgGa4msqpG+a4?=
 =?us-ascii?Q?1UtkXwZOtV3gDIWgpigqjAv0OXdI05c08MuFc7O15wlYCpI9sRaMh09+tSUx?=
 =?us-ascii?Q?VHLlJsB4AEfp4L5bWy7kz+tqBPGhRDUH7dDOtV0zEQYX9Mxl+LgT3HrruBdb?=
 =?us-ascii?Q?oZcjOuoD8dV9sLEGPGP+nUgVpWR/LZmguXVRaBrFXCbXnYYfo+VIyebJ9Gli?=
 =?us-ascii?Q?cJKFXfdZiwl32bAreUv+5AteE01Xm5Qsxk7tf6+RIlMPjTJiu+3VFJ4d5587?=
 =?us-ascii?Q?8lK2F66yrCYYTNc+d61+lX3kUKu6mqzBkoiMPo/C3dEU7mPoSpGxm1Yp2xrP?=
 =?us-ascii?Q?bd1qPBkuxqztDqp4qKGm2r9vdXnwycc3FV4oCZHqdHYtmidOLyyq?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c5eeab45-42bf-44f1-8e76-08dee8964121
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:41:56.9342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lalWE5LToU/U8Cmt5rMCxIOatEw1oyAMotSBpcVkeIgufzuZJ1CP34pep/YOvwi4AHgyVwj2hDhSfGOidRL8hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

From: Frank Li <Frank.Li@nxp.com>

Add dw_edma_core_ll_cur_idx() to get the current LL entry index and
prepare for dynamic addition of DMA requests while the DMA engine is
running.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Co-developed-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Based on Frank's original submission:
https://lore.kernel.org/dmaengine/20260109-edma_dymatic-v1-1-9a98c9c98536@nxp.com/

Changes in v2:
  - Handle zero low words and low-word wrap without reading DMA_LLP.MSB
    on the normal path, and clarify the lost-context comments.

 drivers/dma/dw-edma/dw-edma-core.h    | 10 ++++++++++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 19 +++++++++++++++++++
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 19 +++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index f6a5ad317567..e50fa7965778 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -138,6 +138,7 @@ struct dw_edma_core_ops {
 	void (*ll_data)(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 			u32 idx, bool cb, bool irq);
 	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
+	int (*ll_cur_idx)(struct dw_edma_chan *chan);
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
 	void (*ch_enable)(struct dw_edma_chan *chan);
 	void (*ch_config)(struct dw_edma_chan *chan);
@@ -181,6 +182,15 @@ struct dw_edma_chan *dchan2dw_edma_chan(struct dma_chan *dchan)
 	return vc2dw_edma_chan(to_virt_chan(dchan));
 }
 
+/*
+ * Return the current LL entry index. A negative value means that the channel
+ * context is not initialized or was lost after a link reset.
+ */
+static inline int dw_edma_core_ll_cur_idx(struct dw_edma_chan *chan)
+{
+	return chan->dw->core->ll_cur_idx(chan);
+}
+
 static inline u64 dw_edma_core_get_ll_paddr(struct dw_edma_chan *chan)
 {
 	if (chan->dir == EDMA_DIR_WRITE)
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index abc1bd4c0be2..ba84811234e1 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -616,6 +616,24 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 		  FIELD_PREP(EDMA_V0_DOORBELL_CH_MASK, chan->id));
 }
 
+static int dw_edma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
+{
+	u32 base, val;
+
+	val = GET_CH_32(chan->dw, chan->dir, chan->id, llp.lsb);
+	base = lower_32_bits(dw_edma_core_get_ll_paddr(chan));
+
+	/*
+	 * An all-zero pointer means that the channel context is unavailable,
+	 * so an LL region starting at DMA address zero is not supported.
+	 */
+	if (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb))
+		return -EINVAL;
+
+	/* u32 subtraction handles a low-word wrap at a 4 GiB boundary. */
+	return (val - base) / EDMA_LL_SZ;
+}
+
 /* eDMA debugfs callbacks */
 static void dw_edma_v0_core_debugfs_on(struct dw_edma *dw)
 {
@@ -650,6 +668,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
 	.ll_link = dw_edma_v0_core_ll_link,
+	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
 	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
 	.ch_enable = dw_edma_v0_core_ch_enable,
 	.ch_config = dw_edma_v0_core_ch_config,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 36ee72efcd31..2fc7f8e85b43 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -384,6 +384,24 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 	SET_CH_32(dw, chan->dir, chan->id, doorbell, HDMA_V0_DOORBELL_START);
 }
 
+static int dw_hdma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
+{
+	u32 base, val;
+
+	val = GET_CH_32(chan->dw, chan->dir, chan->id, llp.lsb);
+	base = lower_32_bits(dw_edma_core_get_ll_paddr(chan));
+
+	/*
+	 * An all-zero pointer means that the channel context is unavailable,
+	 * so an LL region starting at DMA address zero is not supported.
+	 */
+	if (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb))
+		return -EINVAL;
+
+	/* u32 subtraction handles a low-word wrap at a 4 GiB boundary. */
+	return (val - base) / EDMA_LL_SZ;
+}
+
 /* HDMA debugfs callbacks */
 static void dw_hdma_v0_core_debugfs_on(struct dw_edma *dw)
 {
@@ -406,6 +424,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.non_ll_start = dw_hdma_v0_core_non_ll_start,
 	.ll_data = dw_hdma_v0_core_ll_data,
 	.ll_link = dw_hdma_v0_core_ll_link,
+	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
 	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
 	.ch_enable = dw_hdma_v0_core_ch_enable,
 	.ch_config = dw_hdma_v0_core_ch_config,
-- 
2.51.0


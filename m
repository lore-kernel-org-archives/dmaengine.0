Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021129.outbound.protection.outlook.com [40.107.74.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67A235DA68;
	Thu, 20 Aug 2026 17:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247293; cv=fail; b=Y7OPMIQX6Xr1ckRKzNKpidqeOsbJZGcHURyT5Jy0CK0h8iiS8bKFpIx7QTLA9gL02dxd+KpOGpSPK5v7W+iSuwJlMrXzBrjS9sPTOSohb2HYVPe332xKynMRFVvEPpCCfH53pryKH+dqeDmXpo2+ILkAFzSMP9N+oEXbEDhkosM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247293; c=relaxed/simple;
	bh=0Cj9vCn+Q82Hc0+Tl5nUSouu0erL2FpH4HuvDsyq2kE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ATOQwCA/VMW7cmCG2FKBK0P3cBkkcYCjPY+78jHIrDMm4mHnyIuuI9p8eZTqEjI/UDZPaLlH0nEpxwqn7SJzkbw5JUlTEzSv+Zk1u7mYZvBi7M64bav+52xCkSBRNWtPgGvPrVhohjZpzOytg9gD3M0NukemydOInLcjrBVnnUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=f2XRx6nS; arc=fail smtp.client-ip=40.107.74.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="f2XRx6nS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ND5X5wHsA+S/0L5PIdiNxszVHd5OTPgtEtUI4i7iOSuvHEJGDeMACOMFt01dm2zxYUtxe0HkdvXOG55K2hM6dTU3NfXLCeVVuFUGmYRcj0dtHm4u/ZOAg58dmuG25+IWxV9Z1O/ZVUerFrvp0+mS9n0rAkGG8wXhZ5OdEWtcpmMmabbIjhHp5nIJ1k6PxaaeN81++HeXX1mGdEifnpHlyoS0kDcAVS029R3G7bcjMGL5+cVzYwflf83KOhYWjHlGXeQjhREXmY1cXDAzFA4AUkZkq1xXpy4EZi2W8nkVFrllSXDN/8daDusI3lxwLfiVrGjfGcwBXiJc6JqEoIqRYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BCIoHzPL6jwIZT8Tjir5LCk5WAJas7qXqw8fvd1J90=;
 b=t6cZhLuyBLI2n85senC1rk/aQwfPUwe3Df0EWAEOwX/OeGYY5HdF1ewhI9ALDy4hTRZlXslWbIxh9OK8ULcF1ch/ZD2ERAktldnJyPun948s4E0VZLu6E1N0ubRBxhg1E8sdJ5EuVLFN+k2mqcjLdUPfz2QHxzoxCZ3iiPK3+BKj3OBNenD2Iu5T3AgyGI1Dd9GO0UEuIC+c3fh8PpTCY9MJKOtFcSaEAcJvv1BsdlR/2vQ6z/cylGHtynbyB59g8kTvpJtB0Kz4FbTsZ9yi9eYCrUAHpM/MsZPiqD1nGZIGJ8p2f/X7h/c4B2MVgQP87TUUOT/ce4NtDw20T6I8SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BCIoHzPL6jwIZT8Tjir5LCk5WAJas7qXqw8fvd1J90=;
 b=f2XRx6nSkeVXJNFqArQH07jQw3/5hDvYj5lXtX1hCYE51Oh19JenitwGlp0WaV+qplzqWmmPyiFMVjNHDI2DhQq3/+zJiX535DRwhmUr3W4BLbTgc+YDIKScULM+fprEOigGwHCrplxwVIiMbVORFVg0F8YT7Jatluyy4dMZszs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7644.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:461::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 17:34:45 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 17:34:44 +0000
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
Subject: [PATCH v6 02/10] dmaengine: dw-edma: Add dw_edma_core_ll_clear() to clear LL control-word
Date: Fri, 21 Aug 2026 02:34:31 +0900
Message-ID: <20260820173439.2004068-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260820173439.2004068-1-den@valinux.co.jp>
References: <20260820173439.2004068-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1c27ad-994d-4825-beda-08defee1531b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|23010399003|1800799024|366016|921020|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	URJq1HyAdsNXJ9B1XRKruPM6/L6ol7coH0nVYO1JXQ5zTJEo7+b8tHO9+M3+LRuKHHRdzILYF0ZY/k28jUmfEJGPk8BR8kp++ZbcX/e9uwzY7ZCtPrpFMItK4nsPEMrRRvZhsWUvGKTaDzG5qj2JAvlbUgRtAN3lgDVfoAmEurkkKHk6X6bJexWExhMepj6XUlZ0vZoitjtw7fSWoVl7s37SSISMCbZyVJCHZKq8u3GqNie8XmD9yyV1+HgbxIoi/dIqU+azrOwlgf8zbwJHMUHySIkNfalAqhZaZqlZcKvvb++GRqKp9otpL6FCV5bEKsmQwYTz+d6YR6z8ild8vovHOUDzUI/l8W6eEl7AJpg9jWpbNn8263/dwp8omuX24wixl/iaZMO35KkLKuZAI6SglvgfoNbbmXuMRK+KOnC2Ak5+CJPO75BFqMDzDNSey6XBulcN8bzsL/Eut1/6hGnuJ5U605tOMlHkT0fbxKWfotJA3aDkoQrhmbdaI3ZXa50JpnZMVw00mn2uU8elvYwWqfK7L1kolMmvYJb+VRq07M44gatn92705+dQtZBMZT7X6M9AXzB6GqHdSU2Q+2pY2a51f9OzOQhFiH+4vcNgmGaseGmuSdvdJDlFeY/nKPDg2Aa/nGnzrSgA3w1Cc3LmEY8i4RGA3z8sZVu2ByKRa4EPlcAxlr0wlApNvtO15gE8JG+5mAfcmNGwv7E8Zw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(23010399003)(1800799024)(366016)(921020)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M/df7AIaDwT1BjjDj7/KCWjdU/sjZPsxwpbalr6wjImqVbnRxjFxLfn3Gfmu?=
 =?us-ascii?Q?ibhHfPUSGzRe+e1Am/1/IB5o8EkILI0km3jdBrqcS6Llb0pVK4cqj0ndGOT3?=
 =?us-ascii?Q?2z26H0e8AWGxi/Rx22XgUp8JmAJBDLG9dzOAVsUT20dVRZK09wyYIFkFhbGT?=
 =?us-ascii?Q?w22vgnmw0WAVq18KiHjHfQqlapxDK5bbLFNOsY95fQhi1LW3jTdYbj3fhabA?=
 =?us-ascii?Q?EetNOgLlzoCk/1AhnHdSeD1ZzDNQ1jaurpQartu3KmobEYQQQEdBkvIGom32?=
 =?us-ascii?Q?QrVHrb+IHcj6KmTOkod/1Hmf/FZWzQzuM85HYYXL0xBYd9ytC2GerCxK5PIt?=
 =?us-ascii?Q?vbFoxs+m5ppMJoaNL/hd2jcgybKScvj29N500WQXsB6F3Gz/A5EguZf92/Qs?=
 =?us-ascii?Q?4MqMnwjef6gqS8HMIBkH00ZciPqmcYOfM9C0F0NPbq+5gHU1TgT9NvuldaV/?=
 =?us-ascii?Q?WM2FwDD5gTDH8n2fcFXaInsMjX4ANk8ZpwrkWwU0T0Y5eVu+QGeFEsyuPlLZ?=
 =?us-ascii?Q?RXISySUY+tB/s42uXT3FUhx+Hzza/ssz+V6l6UOrNpx5V6TFXW7v6AZ5U2Lq?=
 =?us-ascii?Q?ao1PJ8eg5HaXkJBltfyigWu+PCcwxy57a42/nos4cBvGeS3tKPFul6voxb45?=
 =?us-ascii?Q?XCDg3tz43McI4obuZNXzZaMfK2t6pH5EFzPbmJ7XxdaKPowoQjj+LpwZ0G0G?=
 =?us-ascii?Q?kvzuKx/DE1FIql81ZpGXEGNBeTOuuZBR9C7QHFOv+1esc5k2pNT6w6tL3F2s?=
 =?us-ascii?Q?OxZ+8C5oBS3RfJvl6/szd0QgvdE4MeFamgFlOuIoc2pHATwywZWBS0SypC1W?=
 =?us-ascii?Q?FqSLpeUXg6yVAszz3xt69VZ6TO2aiCncCWIwXHKGtRBbBRGrl7JfwZUfxYOH?=
 =?us-ascii?Q?pI7diHrLtEX6/qvwGk/j0mS+6DSrm+WVJ+pjmCvrk594j9yZp0+g0bXF082L?=
 =?us-ascii?Q?hW1W6NOXPYd/CgGIaa9PkDrOR/CRUS1kBKNl1p2aq8eD6DD+oT+Vy+gDF3Ne?=
 =?us-ascii?Q?Q3qehATbaDIxyBkNbXDT0CgDDrmh8wC8uz1mrLVQEOJIDUiAcVwtshCh8/b2?=
 =?us-ascii?Q?3eLS7szdsPfiF6jcCpuy4bFADUIE4cOaiIvQnfF4jwm/kEdER33PDF1jUxNI?=
 =?us-ascii?Q?dms6VwYL7XrkgEJZc7LNcuQJKHE1P6iYmwRzdFVO9BfXMtLNCNNFA1cIvvUk?=
 =?us-ascii?Q?XF5iYVgiinM7GI7otfTdHi+r4Hk0fHb41ap9QRwDJ0BMv/Wc0UjACN4r2on2?=
 =?us-ascii?Q?z71NUN5XBh82OBXz1TKHI/+p9yYLy4ob+RU+LKeWit/y+f3qyjIPSvzgFAvX?=
 =?us-ascii?Q?E0xQ6hs4l7QEtWYUi3QF0bTCfPGQ9T67sGdfH0wSSwVBXBxMz2Mbq+1qMHVn?=
 =?us-ascii?Q?cqHGAq1EXOhkbAeS+74GwriIG6gV+WoRKC4QH8BC2zGgtHcmg7lMeWjgH//B?=
 =?us-ascii?Q?L8jwQvtGZpwDlNd2YbNLhhVt447G0nv+9wgF1PsSpdRL+EJkr245d/Nai01Z?=
 =?us-ascii?Q?YDp2tO4bBGREaUCrV0TS3SR9VAZN3/rKkKatMLNI+ohVu2PEWCXubvmkMRxa?=
 =?us-ascii?Q?6FABncNVhHPMAW5WNnLqoOoWWWc9r0anVr1kipHSaVUzvhSiojjVnojDr3SN?=
 =?us-ascii?Q?ZI+iCnudbL/5ETDLjCOaluv7Bq/cDkkqBwAhA+P8nr2W2kAfQsAXOqc3vX0s?=
 =?us-ascii?Q?sjUme/KDu38cd7i5kle+ZpT4Z8jGr009OdGkWyeDk1HHuqzE7iwWsgRXrXs9?=
 =?us-ascii?Q?lt+5lb7XBtHBTMTWw3BHtuyAl+pAEar5udey0D8EimnnelPCjpHz?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1c27ad-994d-4825-beda-08defee1531b
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 17:34:44.9202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyHQWkCLZ35KiBj4IWmz4s6RGZERc/4LerxN26Af3djl0/APLrpbDBKJ+Xu8wz8uGIhlroMuI/XQZUDX5mfSTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7644

Add a core operation for clearing the control word of one linked-list
entry. A later patch uses the operation to invalidate stale CB when
resetting a circular LL ring.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/dma/dw-edma/dw-edma-core.h    |  6 ++++++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 16 ++++++++++++++++
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 16 ++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index e50fa7965778..089f913fd247 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -138,6 +138,7 @@ struct dw_edma_core_ops {
 	void (*ll_data)(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 			u32 idx, bool cb, bool irq);
 	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
+	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
 	int (*ll_cur_idx)(struct dw_edma_chan *chan);
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
 	void (*ch_enable)(struct dw_edma_chan *chan);
@@ -255,6 +256,11 @@ dw_edma_core_ll_link(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr)
 	chan->dw->core->ll_link(chan, idx, cb, addr);
 }
 
+static inline void dw_edma_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
+{
+	chan->dw->core->ll_clear(chan, idx);
+}
+
 static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	chan->dw->core->ch_doorbell(chan);
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index cc8059182940..bb86d2f60ab5 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -605,6 +605,21 @@ dw_edma_v0_core_ll_link(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr)
 	dw_edma_v0_write_ll_link(chan, idx, control, addr);
 }
 
+static void dw_edma_v0_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
+{
+	ptrdiff_t ofs = idx * sizeof(struct dw_edma_v0_lli);
+
+	if (chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) {
+		struct dw_edma_v0_lli *lli = chan->ll_region.vaddr.mem + ofs;
+
+		lli->control = 0;
+	} else {
+		struct dw_edma_v0_lli __iomem *lli = chan->ll_region.vaddr.io + ofs;
+
+		writel(0, &lli->control);
+	}
+}
+
 static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -669,6 +684,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
 	.ll_link = dw_edma_v0_core_ll_link,
+	.ll_clear = dw_edma_v0_core_ll_clear,
 	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
 	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
 	.ch_enable = dw_edma_v0_core_ch_enable,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 19da1c8fd615..47d7a01658eb 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -374,6 +374,21 @@ dw_hdma_v0_core_ll_link(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr)
 	dw_hdma_v0_write_ll_link(chan, idx, control, addr);
 }
 
+static void dw_hdma_v0_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
+{
+	ptrdiff_t ofs = idx * sizeof(struct dw_hdma_v0_lli);
+
+	if (chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) {
+		struct dw_hdma_v0_lli *lli = chan->ll_region.vaddr.mem + ofs;
+
+		lli->control = 0;
+	} else {
+		struct dw_hdma_v0_lli __iomem *lli = chan->ll_region.vaddr.io + ofs;
+
+		writel(0, &lli->control);
+	}
+}
+
 static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -425,6 +440,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.non_ll_start = dw_hdma_v0_core_non_ll_start,
 	.ll_data = dw_hdma_v0_core_ll_data,
 	.ll_link = dw_hdma_v0_core_ll_link,
+	.ll_clear = dw_hdma_v0_core_ll_clear,
 	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
 	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
 	.ch_enable = dw_hdma_v0_core_ch_enable,
-- 
2.51.0


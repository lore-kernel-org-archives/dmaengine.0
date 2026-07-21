Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021110.outbound.protection.outlook.com [52.101.125.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E4F3B2D0F;
	Tue, 21 Jul 2026 06:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615305; cv=fail; b=oWf+UI4L2PItin5ImrIUIlAwcp0LI7HvgskSkmFsaQJNZraF9Uoz7WSrm17kIjZjnrBcRtS+VkWwLc/7nXZFJ2RyNMY9ptCG4JPZh1RDVca7p0MhWyQtruy2wvIsV7wSfnEE2XosXc4CdQIYq2SR2LP359pbkFAyvQXxBUUfc50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615305; c=relaxed/simple;
	bh=kY1zZBLY83NfPhNE5nztvE9PQPy9Tmfq06YBWAUOct8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZM6kJB7JuXIW7byJawd05Fh63Cjc1+A6Vwz/Ay3W160XKM27qzYg6cz8ZHLkhdrvYIh7MQ4Z1fVvWhc4Gq/ZGg0xoTKgZeoYBS0kLk3IluVWKySiQHQk6hiEfxYhARHHt4vZ9Pbs6woW+2CMX3+E7xPfOiug2zeNAEGUwH4Q93k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=vH9uHSY3; arc=fail smtp.client-ip=52.101.125.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="vH9uHSY3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igsubl1l0b7luhhRud+XM0jgCgxEqAihN6B22W5tOLlNJakXpKuWY692zKV6Gq7ZG1kkxHOw/00TfJHvaxMWndf85CeHYSBNt8Yv7txFLGNvqWBNdFw+Qek48v2l+RLRnPb0Cl4DQSf4O9cWJXbpQ2JQwAPs6su7kPrrj4gkMcYrspzNbxk4Dea0Vst1lT62HtFM2XWW+ALWVjr26sVa88npdnJTH/YZrOrzS+G3ioDpkLgGze5ZaitC6ccHOUtvDCay46qjwJz6BYQY4rnGEvlesIswphloHlHwNd9QLTanjF87NZ+Nj5gT8FrTzSD7qSTK34lES7Z/2qKa1jxGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaG/S/kUAUtCmQ1/X8ImZjLOLBKvDoKUS79OyZ57U6Y=;
 b=RV7LK4DY688E9uuwjfcNyOhFs53hcpx0MxXG/emyHad3eLbn3znmM8u15RMAL8m3P4IhuGeJ7HqaLq0vGxMvZ80moTAePxxR3hqrh4B9whc1c1um91E2iJZCgQ2nh2K7nveejN9fEX0H/eXkYrmgzKCaTcj1X8KUYsWGvbf4L5bIz3N7GTLjl9IRcejLf+l/62OXFw8skJamxOJYO7V5ziPiHJDvj7g+0JxedPL8jOgR14xWIl4efaWoXJqyp7hw1mWKmxaVdMi67vsJPnYvl5gjrGJjXeiQrbs81u4OKkWF1Cs/tl/huEkI6bMUtYMqfNFlZD1zbR4Y1CqUjGBYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaG/S/kUAUtCmQ1/X8ImZjLOLBKvDoKUS79OyZ57U6Y=;
 b=vH9uHSY3Sf+/0Xsfb0/aq5Mp/XXDJHgyZGS7ZQDqKFX7p+ZTqYIZTt/FGZtyRToUCWytbrcuPgiR9uSxL0LxWPFb2mUFObwuI9ylhbhN7OxcEZNkOcwI1WsnzptT9t6MouQPgohdm/qu/4Z4F1dFGy1SCYLsJOEm89czQrSLqRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB6796.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:28:18 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 06:28:18 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 01/14] dmaengine: dw-edma: Factor out HDMA interrupt setup helper
Date: Tue, 21 Jul 2026 15:28:02 +0900
Message-ID: <20260721062815.4117887-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260721062815.4117887-1-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f469641-adfa-4a0a-95f8-08dee6f140f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ITLTqdBkr9G2jHnUjqztP6M3P72PziffzPR/IP7G7jr1+81WTFFfrDhXcdkzXsOplPBZ+2WeFx1mhKk+aUrfTC60cRr94ctzMkpPlaDaPbBeiTLP3E3yU75vvGfAcP+7KEgZY1Lm5dxbwE7BJkWKVTZ1kP/qx0d2SrBz3+LaQswxPPGCNzN+sa9dfY8lIIHzQrXvdTUYj9nC0LDhXxNC4rwG2R89XbU2xHlnwhuelMbb49HmOtZ+pLNZoQhkpGJdP2ooosTMDYWH9svSzxpqoulqjsKKyVdC9X1Lk0/vM2uDiOMKkQQ3d7NNsg2Yb081Fyy1BBPq2va+CRO3gnwS4NVOT8j8eiqzV8Ob99fe8UgtFSUh/oWmW1YnFN7unWryGQKVv0C/ghmgvyOrMVmZmJwcg7mx3R/PtvcKh2NMpjxFkGCMZWs5MxkmjJKYfMOchB+wNdou9yyxhlR9Qq9sGebWQeHibdZOLFNTtmDSzrx9TOPhQXxCECZ7myKFatAS860q5tSy9SHgjjGnWYCu+vB+4SkA/DIGIwKpx59olgKArGDFFwkZDp9Ytb6j4g2H4uidcpASh+4VlsmIhH4YiNKp+DzJh5yiA6rvhq/qZpMfZmruXmmcqUXQThy9lUWdNfo3z9li81KZ0hOHV6vKnjTc4+fB6Ud5S+12598l/Do=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LippFsN3aI0OYdB/c8sKd5lraPl6SCpGk2iSRMAzwSkTQTUhwKfk+bEAEQc4?=
 =?us-ascii?Q?/JrWZ/szbJtWsA6w7KmawEDj2UyDEoBYhL6hq8Ts4H4X43PlDiDQvIqEoS3y?=
 =?us-ascii?Q?PNjabcZ82CGoEXgRJ4eY6aT90TqLctRTOhSc/JueggBkTHyLIh1ZUpPQqQ1s?=
 =?us-ascii?Q?ATmOTfP4r2YjeNbUYYBVc9fj2bYuqdcEv6Pqi1/d4xpL4NdkK182uR1PJOPa?=
 =?us-ascii?Q?LgaQyBOsjgHuofGtL/QUV5hDw4MkB/fsyCj8ENWu4HSlfknAPz+ZhUZyJacP?=
 =?us-ascii?Q?tVc/xwdfnIkL8qOZWADHyNsmumNKp2BIJ0aqpXTcdTPM5E+aLCAMhYamkSbY?=
 =?us-ascii?Q?fbRoBLBngZxgsFdl74+VzZBZ/HlkAf4Fk5S8XsfthvzjJzv68u5c12A2g4k1?=
 =?us-ascii?Q?4pdhCLtohRbfsjhzQLhgLWrtCn92lOh/KBQ7kVTTcot42eZwvr7IHAxDxPDm?=
 =?us-ascii?Q?Sxl6dYQetIxf0NmYt/E4lmeDGjsKGBNTr0huA1jnK1jr8oHhTny5fi53lZuD?=
 =?us-ascii?Q?dpBPP/O0ayxwspS/iBuEg1M1XGIli9Q3jhxwGLKKkrpqq0BHLQLlMfRbg522?=
 =?us-ascii?Q?tAlVKO/DB0H1JYxuUEBKeF5dy7hWUvMwGS5TPCuPVjxHdRFTijA1wVKWjqhN?=
 =?us-ascii?Q?MqjsQIqX8B0PFFh8M5rEWK0HAWtNvWlzEryLgnoh6ILmqpfEafDKxoS2UF8T?=
 =?us-ascii?Q?xPPhtv6CJxcEP51kySPg50HmSiL/PJ0aSmi8bjQUPcnusg9sVDKQPHwDbM+l?=
 =?us-ascii?Q?NB8t80A1U4eeB8tkUAUYwh/Ys04KTIfl/Yg5YccPU2QKV3sxAtniP5zSksOZ?=
 =?us-ascii?Q?d5vGQIoEM/OA/ZJnDCop72Vs9JlEsGL1iQUZEtHFrtjkPPDip5HDRAnhqxpJ?=
 =?us-ascii?Q?a1YHmr++JoApyekQsHjzG6SRROaGShUOe3u9CAZGUC+k+NfGK6sM0vY8+GnG?=
 =?us-ascii?Q?97FzwHflA3q6yzSwDuPFcWz42JubjL4pWPeFIOQAgGmau092lvOEb1rOsQ9U?=
 =?us-ascii?Q?VeVyHJSoaCw7H9lzHa1v2B2Ev2zfnp9djryoWAJZ1JTA0U0SUC05XSiDq6bH?=
 =?us-ascii?Q?95fR5DJak2KUj06h592RYZJXl6VDDDLfkCOyavhrKaDP1ZUDtAuuBBkxOStU?=
 =?us-ascii?Q?Y8MVCR+RGadRAOmzHte7srv8So2dpjCLs8DR6pCjHhFTLmsusS+n94TpgTtm?=
 =?us-ascii?Q?p35Uq9qB9N7+dRWO3fRqFnbcvNi6j+eStoEycz9SsH4lkQnNK2sOpLk0LKPR?=
 =?us-ascii?Q?OAT3M2j15FMIT9k6Jpo+fhIEsSgevHxrO/nNFmU/Z3uykApIEQfLCJF2sCg3?=
 =?us-ascii?Q?KnjsXSCokqqK32yv0vu/kpYO4IDazWD6gJBOUhdaoeGuyDwpcZDVJAKRl1ck?=
 =?us-ascii?Q?N2DJE12wnvuZSJmrrJnV9XT1o8EyytvvqaFYK3cE0mXLwewJvlqRKYs0zK8x?=
 =?us-ascii?Q?9XVlUmm0mSWl/qqpXy4zOwVqx2/CyYwzNWDSz1LBfGe9xUbO7gTG8rzZKGuo?=
 =?us-ascii?Q?Gr+T636Fr18U+cZU1bS6JbgpfTuHDnYgq43Wxas+eIHXiAIR4CiWIg/JB7nk?=
 =?us-ascii?Q?dHO3UOJgLa1+sbvWxgreX91NQchc/dKepNhLdLHM2ib4DdEzZFeuurc2K3qy?=
 =?us-ascii?Q?wKnIvH3yycSytTFwKKfP0Np3RUR2rl4uvWLIgtdzXJ+pX5U825YFF3fziWLh?=
 =?us-ascii?Q?98dkyRaMNcP4qJxSkz06R/6aAjjl/UwjUbygz4bIINwDc2TNYY6KEX08FUT7?=
 =?us-ascii?Q?lcaHns80xKuJY45BwPpXT4fK0p4S9tfpDwrLQwOzpHMCtxXV8rhF?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f469641-adfa-4a0a-95f8-08dee6f140f5
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:28:18.5476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKmPo9+hjkHA7tk/Bj86k/KvfjAKv707hOnVfHGcHAZ8+cqVVXsC1u6pKj+J72dgmqafR+RUFnFmgBJpsMPoLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6796

The HDMA linked-list and non-linked-list start paths both program the
stop/abort interrupt setup register using the same local/remote enable
policy. Only the interrupt-mask handling differs by transfer mode.

Factor the common setup into dw_hdma_v0_core_int_setup() before adding
per-channel interrupt routing support. No functional change intended.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v6:
  - No changes.

 drivers/dma/dw-edma/dw-hdma-v0-core.c | 34 ++++++++++++++-------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index fe64f9931bba..4df541bf34e4 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -49,6 +49,21 @@ __dw_ch_regs(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch)
 		writel(value, &(__dw_ch_regs(dw, EDMA_DIR_READ, ch)->name));	\
 	} while (0)
 
+static u32 dw_hdma_v0_core_int_setup(struct dw_edma_chan *chan, u32 val)
+{
+	if (chan->non_ll)
+		val |= HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK;
+	else
+		val &= ~(HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+
+	val |= HDMA_V0_LOCAL_STOP_INT_EN | HDMA_V0_LOCAL_ABORT_INT_EN;
+	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
+		val |= HDMA_V0_REMOTE_STOP_INT_EN |
+		       HDMA_V0_REMOTE_ABORT_INT_EN;
+
+	return val;
+}
+
 /* HDMA management callbacks */
 static void dw_hdma_v0_core_off(struct dw_edma *dw)
 {
@@ -214,11 +229,7 @@ static void dw_hdma_v0_core_ch_enable(struct dw_edma_chan *chan)
 	SET_CH_32(dw, chan->dir, chan->id, ch_en, BIT(0));
 	/* Interrupt unmask - stop, abort */
 	tmp = GET_CH_32(dw, chan->dir, chan->id, int_setup);
-	tmp &= ~(HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
-	/* Interrupt enable - stop, abort */
-	tmp |= HDMA_V0_LOCAL_STOP_INT_EN | HDMA_V0_LOCAL_ABORT_INT_EN;
-	if (!(dw->chip->flags & DW_EDMA_CHIP_LOCAL))
-		tmp |= HDMA_V0_REMOTE_STOP_INT_EN | HDMA_V0_REMOTE_ABORT_INT_EN;
+	tmp = dw_hdma_v0_core_int_setup(chan, tmp);
 	SET_CH_32(dw, chan->dir, chan->id, int_setup, tmp);
 	/* Channel control */
 	SET_CH_32(dw, chan->dir, chan->id, control1, HDMA_V0_LINKLIST_EN);
@@ -271,17 +282,8 @@ static void dw_hdma_v0_core_non_ll_start(struct dw_edma_chan *chan,
 	SET_CH_32(dw, chan->dir, chan->id, transfer_size, child->sz);
 
 	/* Interrupt setup */
-	val = GET_CH_32(dw, chan->dir, chan->id, int_setup) |
-			HDMA_V0_STOP_INT_MASK |
-			HDMA_V0_ABORT_INT_MASK |
-			HDMA_V0_LOCAL_STOP_INT_EN |
-			HDMA_V0_LOCAL_ABORT_INT_EN;
-
-	if (!(dw->chip->flags & DW_EDMA_CHIP_LOCAL)) {
-		val |= HDMA_V0_REMOTE_STOP_INT_EN |
-		       HDMA_V0_REMOTE_ABORT_INT_EN;
-	}
-
+	val = GET_CH_32(dw, chan->dir, chan->id, int_setup);
+	val = dw_hdma_v0_core_int_setup(chan, val);
 	SET_CH_32(dw, chan->dir, chan->id, int_setup, val);
 
 	/* Channel control setup */
-- 
2.51.0


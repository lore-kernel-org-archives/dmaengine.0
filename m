Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021140.outbound.protection.outlook.com [40.107.74.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B67431E83A;
	Fri, 17 Jul 2026 05:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264605; cv=fail; b=CoSTxnIeE9oJEyLVKMuCai6p3Dh5ynBJ9EF5UHCvDrx1qlv1qO3W7uhlVQgyQB1TgmfhoQoNBYqCY3teOKbGrQZqHIO1rq8AQjyg4dsA8PQpMNz2AE0K0RY4k3om1HNnWKVH2/ZW1/P76fJ650WW9a4HYI0Wc6Fgmq9MmEEqRC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264605; c=relaxed/simple;
	bh=u0xxV0yX3DmibFuVOo5zOq0lKgdfKfTnw8+MFb6K7BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AgIrjP/krdSx0k1alQ//HKwAAYTuVEJN23HCle5NkVcvK/80622zoBxpZYMpSACr1Y5TEBCa04DF10WVCH3S0AvQ615deiwHOr8YeqqklTdTJKk6O8TF83yowVSGm4WkNh1UOL1UdDVjqYz4EPpvWhWGZ+UOjAOvkOmdfNQ35uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=FJezNMPn; arc=fail smtp.client-ip=40.107.74.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="FJezNMPn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnACUNcvp3851/QBuV2OaS0ddq23hEdPGQrZ6l19C3U0BWVyhIXFAHg4KuTgl/byQ8AJ0nSyARHlLkcse4x/kKTBhMTfcoasVFmGK2dkMFLDpH9j1UcFt0YQ+81vgRIvT+B3OHvgw0JwlK6TAmObuOhgp+0ul+4UrLO5FXapQIonUnvxzwpRgKlll3wlnwSuwgcZm90LV+bwD/yqYpbaF5/cedxIV2l89vbe965xSQXr6pQzCMINmZsabtOYfMAB2CCTniSvAd+L3CrN6S1lEtodZaaGWZv/oe0vA2RLS83isYHge5JYJRk6Rs/wXyYEIGmgGuzSjbvqxRud5++8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyxrHfVEczde0s3qkIlRnqKJP4JzErtViedYYUYBg0g=;
 b=SZgANgYYqhseK6l4y04OmLzTOY4FZXKtQdfRaPfgLmm8ej0ct2oUqs9oybiROe6owxlW1WkD5dwfuPaoB0ZZwms6+6lvhGodRCoEvPkFeOzrNnrVZp3Bt1U9R87sYLhCkH1jiVQQXitESnysrCZxbQ7G7A6dptqPKa0jn3Lxov0sufILRz/tpnutWQl4rrIaTqYQI7uqfCb2ATTFx5MGbtPWv+9JSzdGTuOQB7InQIYkYJXgS09cH1qD6grH+jGpW30GFq/X96M5dpvr88N2CmPTTRkTi16shuN03b0D8PEDCFMyMzCY4AbKqC4QOlfQhUU+dvyAIG3T3OsJ9b6v5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyxrHfVEczde0s3qkIlRnqKJP4JzErtViedYYUYBg0g=;
 b=FJezNMPnOJRAA2jQsfn8S773z3tLEgGfvqa0BBwW1sAQts6RVqmCfa59TfztVhRm9ni4LbCM/jRp6aVM05ZBkkJcpV5KRh8ylSee3MWeCUVm8nWCGWbuQT1HzQlsFnR5yp++j0WgvMkF6LFs47po+vVtc7jr2PjTNUXN7rEf9dM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6313.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:03:17 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 05:03:17 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/14] dmaengine: dw-edma: Add core quiesce operations
Date: Fri, 17 Jul 2026 14:02:57 +0900
Message-ID: <20260717050308.2144108-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0321.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::14) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 21cf205e-950e-46cd-7e12-08dee3c0b68b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|10067099003|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3PMzdFSrMaRWEKLR0gVVYuax+82qZZj/CkU/0rG4LSDkz5W4lcpsRp4uD8OyO59dFVk13xh6xc5BhhPyqeHQ7ENbhP9zJb8PAyQA67MjI2erbL9deXlZYtQ+jgxos9Kv8i6K4qpWrFsrdl4DJE+FBsRiMa0l9c5WgvTkFarLd24UTDTqUdjUoWXrr00N+UT/VX0geB2Z9AvC9ZV0qHvxGqEILmpYA7fEbwxmuF7SywKTnzK6S9FXIGndib0eRkH6oD5BG0cpg49aQgC8I4cgiu+dq8Hv6GEkJZdSKdTTveJ0SMMkMkiTap1TRZ+M0YKdXKT0VTcSO21HZMMGGaQiHS4r+8z1MR8mN1kl9lqQzsHA7BDITSokUApG8M6+19BLgRLpIWCHrT9Ku7gGKvPhkg/6q4G8meWQRXWILP9rB4vmkd2SMTN1B6sLtbdijfimJbDVSXCJ3gR8R8DHOGLyclYfyINJbQvNCGxmP4fbYSUPaKl2Evyfqt6KT+FgiPuR3bDbnmK/lq8/CXHaVdIg2FtRJQC9OMu2dwwKjgJU+vY4j4sVYwAFHReoGCihcm4zhDdDqqLd1lMbSduqf1svLx9DROUztQCU1de+uzOKNBgx2n+uPbsI3zmhnSgWXnN2R8908IVAGr0mMWMAMX3Uq5Rjoo/7GyWrAPuL4P4l2cY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SgAjyddlfmNGN+uEUbHzFEAi3KTuXwA2vetosajceWAu+ik3lXFX9rvpVewh?=
 =?us-ascii?Q?j6Il2fc4ZaMWejqNJKR0F5sMtWIJC3YrhYpTtchRDuLnvxViGKBp2Zh8oEU7?=
 =?us-ascii?Q?LIdy+25NqQUzt4Oah2qPX7162AmvcEDH16/TbPYVrmBFOsFu1KEVBCFik6eW?=
 =?us-ascii?Q?owzXIzSamgtcXC11g+pRRnP4vJZyBNJeB/5qcVAPSxlyG2WxnW1qwbJpVy0U?=
 =?us-ascii?Q?aznhpXX1zOGoAIp5ltBhgPR4OfpeNRkJ9J47SVxxV8mXAMCG3JXJ9OqNZnhq?=
 =?us-ascii?Q?GTrgpc4caej8VuPylGHZTdUrPPumInu0nNapVfEWUVYNvUTmx36N0wIgl6On?=
 =?us-ascii?Q?2MsDwbJ/ScQ6b8sWFIi8M41g/X5BgZamz8gYi3wFWvfMJVN2Ht2KfHI/c3Or?=
 =?us-ascii?Q?qM66vv94d2IfcEN0yUseI6awIIdfxC4hO3DxFB/PhX0MKTd+pV/W+BoD3cTO?=
 =?us-ascii?Q?Hys3T+8W/BgUq8XmpuozjLbYjlQ6Iimxp1pcwuZeu4aSONUOoDVTf18xMXwP?=
 =?us-ascii?Q?/Js2LS54qXpYrn/g2hlucZW3XJ8WqEKYYH+Jdnn1uMYgJKweVoCZJoD29Of1?=
 =?us-ascii?Q?x2A2bpOiuPcFdCkt5XBRR0I5OcwwpfDr3361NPO0MNUqs8r5KwRYFA+HKanc?=
 =?us-ascii?Q?/FGuKXZirwYsazxyvO6pVtHGrbvfQBs8lb5dM9ZcoZfraiUfjb2RHgCxEyAF?=
 =?us-ascii?Q?PxMyNcoscaJnHJplvxuCIPQTm0XLSgkd9Ri2JhHmxbGd206uhhMkqxsr/hpT?=
 =?us-ascii?Q?Dso+Va92lRtnRqcsuN/FC8TqWOfeqCEkc/hKmkv/1VEPgeM6cfPuSg8YvisF?=
 =?us-ascii?Q?llIFkxl9R+KBkggdHsDbkfmH9A8+WI0pxvr/Kdz7E10MtjEPZdQjHcHjFwle?=
 =?us-ascii?Q?2elR5mwlFloRjyoAlFnt+P36C4K1UpXIcJknwHwUvFIpf7RF0HUL7JKU/QYd?=
 =?us-ascii?Q?YZwYi6W3pGss4haPLVcVo39RLGK5U2dfrhB0+iyZjMWS6/1L7+6jlfBwRTx6?=
 =?us-ascii?Q?20ODn6a720RuJjVZHqbKcx6RCshWjuZJ8Xp/R7ZDze/JcWkkH185C7HcHLUa?=
 =?us-ascii?Q?h5ngmbnYkOZInDO8aKWWhuMoSpmp5HDNv3U0W4Y2vjDe83KIicLI58DS3tQG?=
 =?us-ascii?Q?qqPDvdFRQN9FsItzZiBtYC3QEddeM3FIBNEGlytG0bmrquFvuYWw7Vec9qdi?=
 =?us-ascii?Q?5AmGiXH1CqacEfovng6tvwkgqekvGCX/5h8JdnGoyRJJ1Svr7aZm9oKnC0WK?=
 =?us-ascii?Q?c1HjmMo3BbnMXQH3+eobCbV7z26dcmbZwE8ZnOx8DV0iQPEll79O04uOInDO?=
 =?us-ascii?Q?TMYv2eBTKNlHAC4dRvN+zKABBN3Fp0ha2MgsNP6qolLSQxKNfXkJB7HDS8rz?=
 =?us-ascii?Q?RMfqFKuKLICf5j7S/DsSXZxunzVn9+5hY7p5nhTmpN2UQJFoHcSFIFRe6lBf?=
 =?us-ascii?Q?Y2A+zkWDiIOiYaaHff3WyN1uMe4DhwoPfR0T2Lel+u/IW6dYYmkeis0cKcJR?=
 =?us-ascii?Q?leVEPLKL/oozBXbF7KbSOqOJHjxpvARYtyrqpxcLjqX3CtLsuZFR55NUmek+?=
 =?us-ascii?Q?SMTNv2lQOwnwlgZp/IKJDNFZh3+jV1Es1c2U/D6cVXmIcSEM6KJYpu7Qqz2+?=
 =?us-ascii?Q?MmExE7k4LZi0OJCdBN7D3d5QhQ9vC2ulLF4WSfj+b6ICQoDcqYJUoM261yQM?=
 =?us-ascii?Q?neF61Vuz528ulkVXUOEBew+5wSSr4Hxr/MXH5xyIiXPUHR1iZCSQluNEalCq?=
 =?us-ascii?Q?Kt/oE2irc404xIPR2ZLAwoqvTDyummY4Bbe5esqoYbaqva1ifCX0?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 21cf205e-950e-46cd-7e12-08dee3c0b68b
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:03:16.9798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJD1yqJBXjV6QzCBVTqg5ak+mN12fXbelM3uaFIftfpy4sblolSEnpzDZpPRzwEMp++HKoFQrA4kt2fWP+4qFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6313

Add core operations that quiesce only the resources represented by a
dw-edma instance, separate from the existing full controller off path.

For unrolled eDMA, quiesce masks the direction, disables ENGINE_EN,
waits for it to read back clear, then clears pending interrupt status.
If ENGINE_EN does not clear, return the timeout to the caller.
HDMA compatibility mode does not implement ENGINE_EN, so quiesce clears
CHi_PWR_EN for each represented channel instead. Both register maps
share interrupt control per direction, so quiescing one channel
quiesces the whole direction. Callers must own that direction and stop
the peer from programming it first.

HDMA native has per-channel registers and can quiesce the represented
channel directly.

No caller is added yet, so this is a no-functional-change preparation
for delegated channel reclaim and partial-owned remove paths.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - Propagate detected quiesce failures to callers.
  - Wait for ENGINE_EN to clear when quiescing unrolled eDMA.
  - Use CHi_PWR_EN because HDMA compatibility mode does not implement
    ENGINE_EN, as documented in the 6.10a-lca06 databook.
  - Clarify the full-direction ownership contract and register-map names.
  - Use scoped_guard() for new code.
  - Drop Frank's Reviewed-by tag due to these changes.

 drivers/dma/dw-edma/dw-edma-core.h    |  14 +++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 141 +++++++++++++++++++++-----
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  31 ++++++
 3 files changed, 158 insertions(+), 28 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 90ca88f5443a..1a9f1b58d2fd 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -115,6 +115,8 @@ typedef void (*dw_edma_handler_t)(struct dw_edma_chan *);
 
 struct dw_edma_core_ops {
 	void (*off)(struct dw_edma *dw);
+	int (*quiesce)(struct dw_edma *dw);
+	int (*ch_quiesce)(struct dw_edma_chan *chan);
 	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
@@ -180,6 +182,18 @@ void dw_edma_core_off(struct dw_edma *dw)
 	dw->core->off(dw);
 }
 
+static inline
+int dw_edma_core_quiesce(struct dw_edma *dw)
+{
+	return dw->core->quiesce(dw);
+}
+
+static inline
+int dw_edma_core_ch_quiesce(struct dw_edma_chan *chan)
+{
+	return chan->dw->core->ch_quiesce(chan);
+}
+
 static inline
 u16 dw_edma_core_ch_count(struct dw_edma *dw, enum dw_edma_dir dir)
 {
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 9f4f8a93ed0e..3e9512a7b201 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/iopoll.h>
 #include <linux/irqreturn.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 
@@ -160,6 +161,87 @@ static inline u32 readl_ch(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch,
 	readl_ch(dw, dir, ch, &(__dw_ch_regs(dw, dir, ch)->name))
 
 /* eDMA management callbacks */
+static void dw_edma_v0_core_ch_power(struct dw_edma *dw,
+				     enum dw_edma_dir dir, u16 id, bool enable)
+{
+	u32 value = enable ? BIT(0) : 0;
+
+	if (WARN_ON_ONCE(id >= EDMA_V0_MAX_NR_CH))
+		return;
+
+	switch (id) {
+	case 0:
+		SET_RW_COMPAT(dw, dir, ch0_pwr_en, value);
+		break;
+	case 1:
+		SET_RW_COMPAT(dw, dir, ch1_pwr_en, value);
+		break;
+	case 2:
+		SET_RW_COMPAT(dw, dir, ch2_pwr_en, value);
+		break;
+	case 3:
+		SET_RW_COMPAT(dw, dir, ch3_pwr_en, value);
+		break;
+	case 4:
+		SET_RW_COMPAT(dw, dir, ch4_pwr_en, value);
+		break;
+	case 5:
+		SET_RW_COMPAT(dw, dir, ch5_pwr_en, value);
+		break;
+	case 6:
+		SET_RW_COMPAT(dw, dir, ch6_pwr_en, value);
+		break;
+	case 7:
+		SET_RW_COMPAT(dw, dir, ch7_pwr_en, value);
+		break;
+	}
+}
+
+static int dw_edma_v0_core_engine_disable(struct dw_edma *dw,
+					  enum dw_edma_dir dir)
+{
+	u32 value;
+	int ret;
+
+	SET_RW_32(dw, dir, engine_en, 0);
+	ret = read_poll_timeout(GET_RW_32, value, !(value & BIT(0)), 100,
+				200000, false, dw, dir, engine_en);
+	if (ret)
+		dev_warn(dw->chip->dev, "%s engine did not stop within 200ms\n",
+			 dir == EDMA_DIR_WRITE ? "write" : "read");
+
+	return ret;
+}
+
+static int dw_edma_v0_core_dir_off(struct dw_edma *dw, enum dw_edma_dir dir)
+{
+	u16 count, id;
+	int ret = 0;
+
+	scoped_guard(raw_spinlock_irqsave, &dw->lock)
+		SET_RW_32(dw, dir, int_mask,
+			  EDMA_V0_DONE_INT_MASK | EDMA_V0_ABORT_INT_MASK);
+
+	if (dw->chip->mf == EDMA_MF_HDMA_COMPAT) {
+		/*
+		 * DWC PCIe Controller Databook 6.10a-lca06, "Legacy DMA
+		 * and HDMA Software Compatibility": HDMA compatibility mode
+		 * does not implement ENGINE_EN, but retains CHi_PWR_EN for
+		 * per-channel enable and disable.
+		 */
+		count = dir == EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_cnt;
+		for (id = 0; id < count; id++)
+			dw_edma_v0_core_ch_power(dw, dir, id, false);
+	} else {
+		ret = dw_edma_v0_core_engine_disable(dw, dir);
+	}
+
+	SET_RW_32(dw, dir, int_clear,
+		  EDMA_V0_DONE_INT_MASK | EDMA_V0_ABORT_INT_MASK);
+
+	return ret;
+}
+
 static void dw_edma_v0_core_off(struct dw_edma *dw)
 {
 	SET_BOTH_32(dw, int_mask,
@@ -169,6 +251,33 @@ static void dw_edma_v0_core_off(struct dw_edma *dw)
 	SET_BOTH_32(dw, engine_en, 0);
 }
 
+static int dw_edma_v0_core_quiesce(struct dw_edma *dw)
+{
+	int ret = 0;
+	int err;
+
+	if (dw->wr_ch_cnt)
+		ret = dw_edma_v0_core_dir_off(dw, EDMA_DIR_WRITE);
+	if (dw->rd_ch_cnt) {
+		err = dw_edma_v0_core_dir_off(dw, EDMA_DIR_READ);
+		if (!ret)
+			ret = err;
+	}
+
+	return ret;
+}
+
+/*
+ * The unrolled eDMA and HDMA compatibility register maps share interrupt
+ * control per direction, so the whole direction is quiesced. Callers must
+ * own the direction entirely and prevent the peer from programming it after
+ * this point. Partial ownership mode validates direction granularity.
+ */
+static int dw_edma_v0_core_ch_quiesce(struct dw_edma_chan *chan)
+{
+	return dw_edma_v0_core_dir_off(chan->dw, chan->dir);
+}
+
 static u16 dw_edma_v0_core_ch_count(struct dw_edma *dw, enum dw_edma_dir dir)
 {
 	u32 num_ch;
@@ -332,34 +441,8 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
 
 	 /* Enable engine */
 	SET_RW_32(dw, chan->dir, engine_en, BIT(0));
-	if (dw->chip->mf == EDMA_MF_HDMA_COMPAT) {
-		switch (chan->id) {
-		case 0:
-		SET_RW_COMPAT(dw, chan->dir, ch0_pwr_en, BIT(0));
-			break;
-		case 1:
-			SET_RW_COMPAT(dw, chan->dir, ch1_pwr_en, BIT(0));
-			break;
-		case 2:
-			SET_RW_COMPAT(dw, chan->dir, ch2_pwr_en, BIT(0));
-			break;
-		case 3:
-			SET_RW_COMPAT(dw, chan->dir, ch3_pwr_en, BIT(0));
-			break;
-		case 4:
-			SET_RW_COMPAT(dw, chan->dir, ch4_pwr_en, BIT(0));
-			break;
-		case 5:
-			SET_RW_COMPAT(dw, chan->dir, ch5_pwr_en, BIT(0));
-			break;
-		case 6:
-			SET_RW_COMPAT(dw, chan->dir, ch6_pwr_en, BIT(0));
-			break;
-		case 7:
-			SET_RW_COMPAT(dw, chan->dir, ch7_pwr_en, BIT(0));
-			break;
-		}
-	}
+	if (dw->chip->mf == EDMA_MF_HDMA_COMPAT)
+		dw_edma_v0_core_ch_power(dw, chan->dir, chan->id, true);
 	/* Interrupt mask/unmask - done, abort */
 	raw_spin_lock_irqsave(&dw->lock, flags);
 
@@ -553,6 +636,8 @@ static resource_size_t dw_edma_v0_core_db_offset(struct dw_edma *dw)
 
 static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.off = dw_edma_v0_core_off,
+	.quiesce = dw_edma_v0_core_quiesce,
+	.ch_quiesce = dw_edma_v0_core_ch_quiesce,
 	.ch_count = dw_edma_v0_core_ch_count,
 	.ch_status = dw_edma_v0_core_ch_status,
 	.handle_int = dw_edma_v0_core_handle_int,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 52f54e14544d..77260c076cd3 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -72,6 +72,16 @@ static u32 dw_hdma_v0_core_int_setup(struct dw_edma_chan *chan, u32 val)
 }
 
 /* HDMA management callbacks */
+static void dw_hdma_v0_core_ch_off(struct dw_edma *dw, enum dw_edma_dir dir,
+				   u16 id)
+{
+	SET_CH_32(dw, dir, id, int_setup,
+		  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+	SET_CH_32(dw, dir, id, ch_en, 0);
+	SET_CH_32(dw, dir, id, int_clear,
+		  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+}
+
 static void dw_hdma_v0_core_off(struct dw_edma *dw)
 {
 	int id;
@@ -85,6 +95,25 @@ static void dw_hdma_v0_core_off(struct dw_edma *dw)
 	}
 }
 
+static int dw_hdma_v0_core_quiesce(struct dw_edma *dw)
+{
+	int id;
+
+	for (id = 0; id < dw->wr_ch_cnt; id++)
+		dw_hdma_v0_core_ch_off(dw, EDMA_DIR_WRITE, id);
+	for (id = 0; id < dw->rd_ch_cnt; id++)
+		dw_hdma_v0_core_ch_off(dw, EDMA_DIR_READ, id);
+
+	return 0;
+}
+
+static int dw_hdma_v0_core_ch_quiesce(struct dw_edma_chan *chan)
+{
+	dw_hdma_v0_core_ch_off(chan->dw, chan->dir, chan->id);
+
+	return 0;
+}
+
 static u16 dw_hdma_v0_core_ch_count(struct dw_edma *dw, enum dw_edma_dir dir)
 {
 	/*
@@ -355,6 +384,8 @@ static resource_size_t dw_hdma_v0_core_db_offset(struct dw_edma *dw)
 
 static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.off = dw_hdma_v0_core_off,
+	.quiesce = dw_hdma_v0_core_quiesce,
+	.ch_quiesce = dw_hdma_v0_core_ch_quiesce,
 	.ch_count = dw_hdma_v0_core_ch_count,
 	.ch_status = dw_hdma_v0_core_ch_status,
 	.handle_int = dw_hdma_v0_core_handle_int,
-- 
2.51.0


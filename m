Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021086.outbound.protection.outlook.com [52.101.125.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAADD408634;
	Tue, 21 Jul 2026 06:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615316; cv=fail; b=K9RVQfszn+pHm5967zF4UQFntT3SnX0WB7FiU9FAFAf9c/MFj6AwUytfOBnHX+4vuCKRAgv3BBzk5erZZsApdx3SvHHq2vCuLKjBXLH1JEvZdMuN23YFsu2EnKcSOx/6cxHBg+8KCZI3c+TxYU9tmrgOpE/hXx+4IRKG0ilv4Qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615316; c=relaxed/simple;
	bh=C4458MqaasVBOjDSKuU9tSb+B9UX8mKyc2RxmKiDB24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XEDMGlIZcjIeHJO1Av+Vg46a/NjNu1CkNKmAqVl7qaN8oYg9DR/TF3zYLOauJlRb1VCm8QF4DXsUx0z6PjocHRmfriusD1ZSJsBejpZ5rNCNwac9edmBjo7lkaEdnn6AgyDL6mvOIHNY8BVVtGGZ5s+sKv/SM0Sp4jGmFfkfmOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=NEX2xB6s; arc=fail smtp.client-ip=52.101.125.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="NEX2xB6s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUSwsHfZnekMkIbEXtFHrcZiXBPYu0f2sxWEbWAPFmI6sRw5Usht6vBC5lZCZPmNTGxW+/m328FR1NBlPZ/CCiVw1Svv6xKShETQe3Bo2139yhfWnaP7TqnF8T7aZmEysYYqPADWcSfJBZbAplJy8DmiKgIkIG0fMPi6jYVTFs0bcIinv4G17efHK5nmo32GYXhloQPdJlRhdG7XCnWd38HzV1hJJlHYrQMjRwUiUrqFuaznXguVg6hO0QJLblMUA4/ggI3UxPraZiSVUwwyfJllqAdvNDs3dC+9yN2SR2DxwgKYaBP0ZBatDFuDW3FIoXafl0fnkQbZHpIyExPs3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JViUWTvngCjXwoTnrmlSKoaHPlzxwNd5NfnmdhPzF1I=;
 b=Jrilg9TnyUlQG8t5O+prTfbZpmyuI0OJSBxzO6zqNp5gpuU9vt67o8+5UYvJwNxTMHnXxEwSShYww+wNbZ5HDW96TP7ODLO/3M/wjBtBixQPmZrMEKeYVU9m9SLHcklo++MTbkPR8VyLMZcZCrw7UHKI6GuBRbplMBi/j3zgdIVWt1QTyJjLzkc4M0SFfEEPzJCbE18y4YMVUesPWnD2GzU24eZ6DlrwUyulOhm+WhbhdaeLV8E9xUMOuGzburqFd8VVTtPahq0AO04Eq3b0M+1DwoihDqG6Z+dBDIXkTSqXr5j/gua2Aqy5QvWflRbJVmqCPZWnS9D1fzJstBiXFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JViUWTvngCjXwoTnrmlSKoaHPlzxwNd5NfnmdhPzF1I=;
 b=NEX2xB6smpkASYrZpMCoc58H8uqDIroPsXbOZxb2dpWLpfaltF79rw6a3fvvxXnVX4Tn05AbZ7Qdkcat9zOz8fm7UmBHTn1umBZ60yjgWBsESy3XoDnDokCLaoZGkLHqu5XnDnrXnmKgMG2KK4sAx5aW60T3hyHJDTbYDHyP7KE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB6796.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:28:20 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 06:28:20 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/14] dmaengine: dw-edma: Add core quiesce operations
Date: Tue, 21 Jul 2026 15:28:04 +0900
Message-ID: <20260721062815.4117887-4-den@valinux.co.jp>
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
X-MS-Office365-Filtering-Correlation-Id: 4b6652f9-d0b7-4750-e762-08dee6f141e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+LPevAziJFXO1GPLWLVjlHzijdArO+VYl40NQ3jDZPbmOw8tKMLryvJWppS5NdymcLAwRXk1/z5WmK1ZftKwPNcn12NEQxXqHGWa/9yK++hSB7aIDD1cdzDbPftJIQczVfS4iF1a2YLv6+4C2WyWJhkowiQfnjetQjAKNis70qZKD5WFveLQ7jr0TF1gINHtxiaRyDhUDyIP4c851/cvudNIAu8wqK07h5GUcQxG09kPsBPcSy1sKfWsvKEguyBkPfFckmZ98C75Gw4fFBciVaNc8sNCtegeH4K9SOI0h80VS+CBV/k0cyBG++BivYUXBHXespO68SE2uXFDpffbDJ8yRtJua964F4XjxmksVxpRp6KaitXGYNCRc4gVoIn1VKeW5Qrs2pCba9uVf7Vj065afxRq5ZumFBblESSDyGOcYuKLKaqC3S6v4NcatR0NlmFIo/yHI3jvzwMUABn+UHAvQLjlLAIQNyn4L53nVa1dRF8hJOo0zm/0C3ziUDyGIubXAtS6+bSAl2SDNa+/Q0rpwankpHfWUVCoLdoTAQK44Cde18s+KIOU8ie4UohSQZeOe4CoYeY35Lh8M1xKK6LPkyBQUMABPUyHysnIekTYR467FfHdXYhAXAOZyNDWJyHmXRDOCCSbwH/3qcmSBD/1YeS3Hj3sFfKI0+bUaXA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8N8hVMlixolovx5dvg4ciyE2EVMbmk+7vkxHIFWRk+rbFdfNHuWBj6rucB6l?=
 =?us-ascii?Q?ktfPoxgyBz6T91BsHs94LSgCMdEsx6fVSypacE0Z2lvNf3Rt/ZBPVMcKSo1I?=
 =?us-ascii?Q?tfk9jjzFgoMGwcPXYuw7mUgHHitjwJuA8isl1s2+2ptxPMmz9oUHmafezXPL?=
 =?us-ascii?Q?TTqi+8Yf7OuyKT+484A+EuP/qHKd1OdN0bnVLY8MZkNL5qDvXPNyxdC6TaXf?=
 =?us-ascii?Q?k7hRfzHAaaAOnWpkr2t8+YPVdh4NIeVerOUuzKLFqJZSXffmuAhgkD7GVX3x?=
 =?us-ascii?Q?XJTQRixis0rHdtAodlmv9rJAvk//+B6b1LDxufhTO9zxWUqHLWzBGkGaVHJZ?=
 =?us-ascii?Q?WIAiJpJV3v7hDST4u0YHkkp9BKff3gHd5qn4zJ2y+hZrvrhbBODpzgP1rSyV?=
 =?us-ascii?Q?P0dMCyOPbiuXVdR5mlhaiQzojjYowfDOCTYdlZBuLR71TjBHPH6Jr3VXspyH?=
 =?us-ascii?Q?J8cruIplaVatO3HYZKxV6Bvqfc7L59WK9eNXIejEf+MdNiSERidLldtHg6tO?=
 =?us-ascii?Q?rSwyMw+cZd93L0FUG9EFXVtJY78U4kjw6wfOsWaGhlirA/OsdfZ9v3l0e1hA?=
 =?us-ascii?Q?0SMRo6lGqOSyBqg1JBfu8CRiQ/uJpo+60EjdD6eZV8JvVNBHJPXV6eR8Zt2i?=
 =?us-ascii?Q?UfNJBTkUqNwNSpgbr++q3hM8NOH2jq+19iQlqBPSjkCEaMXl4gY7TilQx2cq?=
 =?us-ascii?Q?cj8B4/7j6x+lX91R4nrgStoZUU0jjcoBfIAIrpI3X26VS0uf8fUjLBtB8pgn?=
 =?us-ascii?Q?joxuAH8bRV/I7YxO5u1cz6XX+pu9zvo3wnET7VAcAN15/CkibJ6fFSyoDyZg?=
 =?us-ascii?Q?fvLYwJiJCH9q01ZUXWSKjpJlPwiESPtgO9I1tSYnkjtgxXA+S0xCCfcq8iAI?=
 =?us-ascii?Q?Uez0WAk9wqauiwN21oYWFVY/Gj7hs/DbuCla+oTj0zup4SLdagut2ebcBwqa?=
 =?us-ascii?Q?JqAgppwuYL0REeS9THHn9aQUJoBOs4SJ7l3sSd9RPUrX5tGm6c8bHL0h1rTL?=
 =?us-ascii?Q?vP59zbbb/Kg1y0uCu1OXEJEq16DK5X0oZnQZ9P38xiIWqr5U80YG2I2xYYDm?=
 =?us-ascii?Q?Hh3PrUcH39RMSWwqMySTo10FHuFfuu9MfccNag2iOit8y/C8u3r7oaMds43S?=
 =?us-ascii?Q?uFgfzHse/lxTHTlkUifUsIHk3DpH7MjT3gitRe/5lc94QE0M+/SdpkrGVONT?=
 =?us-ascii?Q?KEo2S9XisIyAf2z2NUy+uWCZc82GKtyCLv0YVfdbnjj2YEJ8Wi43xpL+vK8I?=
 =?us-ascii?Q?L2M7sKWJOJowDATbJmJf7FkNjsBtcEKpbh7JLseB94LurxCBcFbCeTGRs7AH?=
 =?us-ascii?Q?EAa+X456aPDVrVwvUh7ZOZiYxBJ0g8n205jXZ3UtdvZeImT4mk0TpOyxBTKm?=
 =?us-ascii?Q?Fx0/vclj/VlgSKfT5dc/kPkNBw56dk5BYOk/GeauoXpSWqzvN+4SfC2ExWn7?=
 =?us-ascii?Q?n8QXixCocR6wILcKjcBEyVib4jqMn3EIO/pCcHXbEJMQQTVLYzrKzajiOzdc?=
 =?us-ascii?Q?njU0I8+no36wEIErOn/b67+i1UrvmfVeH3VXJmj90B1D2+lD/zvTUXwtQ7KJ?=
 =?us-ascii?Q?u0Ogi+e1gOT1vbfHt6RWhq2ZeEoPDFtLuy5W3Yz6oZcrPahuth+Qh4679v4N?=
 =?us-ascii?Q?dWziRYTRBF93vCTHPfLmTaSQ7hoNaiLM5qnpjDxgxMYYO2zjLAWT/Ymy67hO?=
 =?us-ascii?Q?a5/8w35Zl9tlSMVECKReLhqImbjKnIZOLMnkrfg+VtO35+lI46Ph9qCjdamZ?=
 =?us-ascii?Q?enB/F2PnvZaToz/rmYSN73bpuXXLifCkumJYytzHdnOP1TCKxkGj?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6652f9-d0b7-4750-e762-08dee6f141e1
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:28:20.0778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwFUaHwnMwq4HY12V6t7iX6HSy822cdkcIdgYP1/qbUjzwS9yHGfuCFDyle4uLEqbWI9mhz8H7gy3H2cjR98sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6796

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
Changes in v6:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.h    |  14 +++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 141 +++++++++++++++++++++-----
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  31 ++++++
 3 files changed, 158 insertions(+), 28 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index ff20965db4b2..bd3d532ebc89 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -127,6 +127,8 @@ typedef void (*dw_edma_handler_t)(struct dw_edma_chan *);
 
 struct dw_edma_core_ops {
 	void (*off)(struct dw_edma *dw);
+	int (*quiesce)(struct dw_edma *dw);
+	int (*ch_quiesce)(struct dw_edma_chan *chan);
 	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
@@ -192,6 +194,18 @@ void dw_edma_core_off(struct dw_edma *dw)
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
index 66a605f28a12..13e69ce6c41d 100644
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
@@ -331,34 +440,8 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
 
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
 
@@ -552,6 +635,8 @@ static resource_size_t dw_edma_v0_core_db_offset(struct dw_edma *dw)
 
 static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.off = dw_edma_v0_core_off,
+	.quiesce = dw_edma_v0_core_quiesce,
+	.ch_quiesce = dw_edma_v0_core_ch_quiesce,
 	.ch_count = dw_edma_v0_core_ch_count,
 	.ch_status = dw_edma_v0_core_ch_status,
 	.handle_int = dw_edma_v0_core_handle_int,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index e9b4bc66886a..8d20bb028b52 100644
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
@@ -96,6 +106,25 @@ static void dw_hdma_v0_core_off(struct dw_edma *dw)
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
@@ -366,6 +395,8 @@ static resource_size_t dw_hdma_v0_core_db_offset(struct dw_edma *dw)
 
 static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.off = dw_hdma_v0_core_off,
+	.quiesce = dw_hdma_v0_core_quiesce,
+	.ch_quiesce = dw_hdma_v0_core_ch_quiesce,
 	.ch_count = dw_hdma_v0_core_ch_count,
 	.ch_status = dw_hdma_v0_core_ch_status,
 	.handle_int = dw_hdma_v0_core_handle_int,
-- 
2.51.0


Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021110.outbound.protection.outlook.com [52.101.125.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B9940912B;
	Tue, 21 Jul 2026 06:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615307; cv=fail; b=NrKLRU6agJJEDFJ7aeeJmSHGLssYOAvUTDgRVR+WCNr9mCseIlzQTT8aACsYXnrzzVvCeiC9AwjSrBZURdnw/5ofW0ACTvjryqCw8e8k994GkVWFM9Br0lUfKkdwEImu2jNir8OQrEiLaBKf6aTUmM1g0v/ggI66yrYjkrcBq90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615307; c=relaxed/simple;
	bh=lYhu23nltM/2UzBnv/PyuG2/REF0dKjP9DmGO8XUplI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ti1aR52bAQUvlm/wUKILxYqzUQnVzIZ0wDkJ0bsEHcA0AEMX+fxmDAw3+NxTcxjO7kkVZzqbpD6FHXOFULEiWg3iuoCr6A195Xs7v75sFl2nSJ1MHHYj9hulINVco13o7fzmCblvvtBNB2TqMx+Nu314j3ze9kKP4idVZlVrA14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=BvpHpMET; arc=fail smtp.client-ip=52.101.125.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="BvpHpMET"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLnZxi8Dhb5CTkHsTl5MVs7g9c3sb37JOEOkIX0iC90d0CpMjXLJ+N4021NizousSujycnSpKwMyO5ZcFNELtLh2Lukjs1tgxAQdKN05yCshwRUqXlCAMpkpFeLxVtGmw5Meh06Mowu46qWimcQJxrFE+WV6rvuv16S17zv6/QXdIVnj0+J2r9SYDC9T7fDaG3xekfN9p+dTMUu+t9WGSP6gWuIJJb1d+PYqw1JWuwqWnOHorefmF2GmhPnNusfSzj0oCwztqzYqHkA19P7oHmKPbno9vFp5J3gZ7M2J2zqET1K8Dw+Nubq9aCum3DHLsU7eJf5oQWSCFLfFnXzsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkGi1fPk7/+l5XGDXqsexgAJ4wRGBG0E16mmoGKvoi8=;
 b=SSyJn6CeoAakpGD6XwOrswwkvRRsq9Nmp4aAnBkuBq4LlgJdgp/Er6Gv1cYIuO+oPz6rghD+c3/14kp4NbYt99N0LC2dk906DMybWsrgKxoLzUkYgFdqnOyBR/7qIaXEVqkCJfjhwO+VZYz5mA0x2+3vSCmXriO4MTd/3rOXqQCvfzwXrf971s4WbEturA/JBpRc3mAimYVauDS290ZjtppAravcFvWPmPf0wGgzgDH48wgllYh/8OoDqeGNGfOIt0tHI+DJvCDnzd7lnlemWt6HDLwzs3+tmPYLpEHG9omELy0sEzLC/yHsNLKsYxmF/W4ZsuP3c9gZWrLqhS2TwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkGi1fPk7/+l5XGDXqsexgAJ4wRGBG0E16mmoGKvoi8=;
 b=BvpHpMETGT9uDY7G9mm11WQn+bdMdLfxvTvHGman6yFRFqT/whQD/Ar7iyVCx/1btZkoFEhg6YRaFICuPClTYwNmVaKR0wSaR7HJSevDq4DyvKyeYRY90nd9gr2uqt8bNkb6H1V8aY8Kc/CW4P7ZojF1tjcwWFwNWEvjppuuoh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB6796.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:28:19 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 06:28:19 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/14] dmaengine: dw-edma: Add per-channel interrupt routing control
Date: Tue, 21 Jul 2026 15:28:03 +0900
Message-ID: <20260721062815.4117887-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260721062815.4117887-1-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 642fb9d3-5e0f-47ea-af73-08dee6f1416f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LLcpkS09CP9hFJp02ujmQ4K12fdvQlJ98tJqsJAofEvHoyyICsVJW8wYtfsTy1rTY9pw9QCVjql16mIG1FDHYJGt1ehpjeWwynkSPCZjFHrU2Xln6PIYJ712vPTMAvirx1SIL4glZny3+W3OChxdVTUN4l/5ACaqv790Nh5JpKXbjXGUA4r4RoRvwC9JTpbRSPGH5ZDpvuG0yWC6DF85u8a8lXTLHRbLIuEP/+pxZgVX3YFY59eeI/ozD71ABRn3JSY1LMwAfLcebAkVwZDUYutCgHShr+FCytcNtOE3e1Tnd9a6uMwUompJruaW/5Vt8/HI7e3c8d93woupcWAKDK6Bt19J58rgTxtacRWnW42os7kWnyxO94mi2tpxTSJ/paZ5yq9+QOQBEAMC5wM26i+ho2PFJSKoI1sHFPmluao8QEZMuurq1lyQTxviXN59fMGBfGVcOOJDH2wU8/16tluMaLwlz5pso+lW7zeoeyh5HkQY1ybEaTdhQkHXVCXUmmE2wKv8U41AHO5AZ8uBmBnY4TFvihkIbW5yAbSmaWyArB01/qyCbJ7py+iwuRHgMZf8ARFZIFlLZuyx7P3AzNTFVF5gZrXVR5gJLz+jue/vP6jtygjPI5gJm2CjolAuSr1O0Jy9ksky7LdyFCfzy9jQzhHDjoP3aXlshHgjCQQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AGeIza6KPkd3Vb3u7Jq80KH7ORPdVgdX4f9ytZNqip4+8+ov2yMD3ksHHQ06?=
 =?us-ascii?Q?u9UCbUYMv6HDtkK+B1Lxm0jROTPBCNyT1dCEF2A9/C45m9BYargGg7DZ1Qyq?=
 =?us-ascii?Q?iLnhP5NqPAecrZ8r/01Tj+7u9SiHNCsNfEJdi2/wEP+jdJT/AHVKYWw1U5zF?=
 =?us-ascii?Q?NbJ6IZeQCEhBVVhtL38tq/hUwoGXyjVHfzwBNqeLlPDJklgYsy90V1LcI4NO?=
 =?us-ascii?Q?n7f5IYdtNS7HpPa+3QyI0RRem3uwy769Xf9Q1u0wxu9dRH2AF507yqPpkl/g?=
 =?us-ascii?Q?hzO36b6mF1Pt8ntw0wjwPOFbk8Gkl7iBr/zlnJGGI7RmYNF/cDTL48yrr2fV?=
 =?us-ascii?Q?Sw7oAdWrgdigqTv8+Dioy4hTSm5zVK8/qJsRgT9l43p6Zabs4TZeyCd8f/JM?=
 =?us-ascii?Q?+Jn4fvLEkCdonXDJFStHxjvRCqmtnHfYTtIiTp+1TM+yobZJ6Tpq4rmOKla0?=
 =?us-ascii?Q?WR2UYmzfhxC0PuYqqErgzXDX+vx6WN5hQS6A2VCy3TjwLOuA04/t60m5rxNa?=
 =?us-ascii?Q?mknIfLFpypGTUQ14i3r82Q+mXMy/nspCeo0hUrURgiCmgL44FU9Q1nN3ujmK?=
 =?us-ascii?Q?v5XyS2oSIyZB7D6ma5xztCyJPsMVN2UbTwUqxKuOad/2r2AakdIkT6JyIJrA?=
 =?us-ascii?Q?/GpR1ladI7jR1SisfWH7ZkaK42ztawbUA3lzai6Wx+ABfZ4w5CJxTQLSFYWG?=
 =?us-ascii?Q?FPnS6me0Ywz2mVEwYLa0rL2XbBazZ6hfbaFfFgDJxUcx2xkeSFZZ30Vi4MQt?=
 =?us-ascii?Q?8lTntQSi6/wBhbYY4JFbcu+9z8OCtXRQ0deJ3z+vQGFWHMmHEuSZB9cQ/4jS?=
 =?us-ascii?Q?iY58zBGuhCsz6zzSjWR0bMjsBKl+bH1RMoMbScmuwryYObg/QtgyvhCMSXrW?=
 =?us-ascii?Q?7yZlArBKWAIYf5pQqyD9lAiKNXCkwitRPyu6/Xbg2lXFIYs/grey7OObVYU8?=
 =?us-ascii?Q?mpSkyeyiICvH3NKAjAZbIpBmpb5/r0AhNzTiuL78ia6czPm/64woy4Hum3lk?=
 =?us-ascii?Q?wGjK0wu/h0CTaHghu0BKgySsoJ50UzNGP5BH3s9YOUrUKQ6CxmMOY0MCpwtd?=
 =?us-ascii?Q?0jhnXQ7oj1JmXAJcrrM2Bz7OLn7HcwylAlir5RJSLG6v2GDcwFmeXrYvbZwq?=
 =?us-ascii?Q?4BYTjJKXNXZPtohbsHmnkuQlj4mTWE89O/TuFjmD/HjgW14YeNcH4F8qp6mn?=
 =?us-ascii?Q?s2ydskqZrRp04f8rPk3sAqeLPFv256UbwK/YWrOBvLMRichu4ifP1t0C5lDi?=
 =?us-ascii?Q?/pjkKCVk0yPkcwjVsJxDTpPAZZHChKCk1bXmXm2b3dy3rGnwQvduJCFKTr7/?=
 =?us-ascii?Q?tB5KBLtxnwaJrMx9aPS9z5cFBuIsPuebCK+BpVtvJyPsUWrgr4FBpocCNLTA?=
 =?us-ascii?Q?YM5Y1QoesFKug+JzrggDe7wVx7H9wDk2F3g9MYJJu1Pcr31fVrq1en7GPaVu?=
 =?us-ascii?Q?5B/+gMXTzdOIJ6KpN2+r0zIhntYgw7GV4lh/QxDgzvxc0pezQl1XK0H0nron?=
 =?us-ascii?Q?qlxyE3+UDSaw/pYk7wWCEc0WkIhgPZkIjXhiEUF6JM/dYNogBMNlqAeq1Wbl?=
 =?us-ascii?Q?YKd9CyW/MyU/ygH7gY572SYobSv+8k3hVqzNOqXR+Tn9/KQLgEdpphmNipwu?=
 =?us-ascii?Q?6AAWMJPXqfsRVY876iNsVVxK82ierWT1wMIDyH4ZK7Q8Tkz2y/YPLEm5xZp8?=
 =?us-ascii?Q?UGZjQqzOPEgiU52ZRudjsceIxigehV9uaJf/+2CV2XAk7l/G372YvMh5ZxA5?=
 =?us-ascii?Q?/H/xWl5SQH2q2tAKyLYqzh06G4azMDalboXZD4QakNEIxk4FoyMt?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 642fb9d3-5e0f-47ea-af73-08dee6f1416f
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:28:19.3276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwJw/GUkOBTY1nz2hO+cIO/YqD2nBvbgvQQkjUfRQU31291+AJYs6bxFs8jGJ6vG7fV2MjsMHI5BXa6bqJqN4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6796

DesignWare eDMA can signal completion locally through edma_int[] and
remotely through IMWr/MSI. When channels are delegated to a remote
frontend, the local endpoint side and the remote host side must not both
service the same DONE/ABORT status.

Add channel interrupt routing state and initialize it from the controller
instance configuration. Update the eDMA and HDMA native paths so
linked-list interrupt generation, HDMA non-linked-list interrupt enables,
and DONE/ABORT masking follow the selected mode. For HDMA native
non-linked-list channels, keep the local stop/abort enables set so status
is latched. In remote mode, also enable remote signaling and mask the local
interrupt pins.

Keep the existing dw-edma-pcie host-side instances in remote interrupt
routing mode so their IMWr/MSI completion model remains unchanged after
local routing becomes the zero value.

Note:
- The routing mode describes where a channel should report completion.
  It does not by itself say whether this dw-edma instance owns the
  interrupt status. A local instance must ignore remote-only channels,
  and a remote instance must ignore local-only channels, even if such
  interrupts are unexpectedly delivered. Otherwise the non-owner side
  could steal the interrupt from the owner by clearing shared DONE/ABORT
  status.

Cc: Devendra K Verma <devendra.verma@amd.com>
Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v6:
  - Adjust context for deferred channel IRQ work now in the base.
  - Tweak line wrapping in the commit message.

 drivers/dma/dw-edma/dw-edma-core.c    | 10 +++++++++
 drivers/dma/dw-edma/dw-edma-core.h    | 13 +++++++++++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 30 +++++++++++++++++++++----
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 25 ++++++++++++++-------
 include/linux/dma/edma.h              | 32 +++++++++++++++++++++++++++
 5 files changed, 98 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index e4dde3518b83..3a8610862cff 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -168,6 +168,15 @@ static void dw_edma_device_caps(struct dma_chan *dchan,
 	}
 }
 
+static enum dw_edma_ch_irq_mode
+dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
+{
+	struct dw_edma_chip *chip = chan->dw->chip;
+
+	return chip->flags & DW_EDMA_CHIP_LOCAL ? DW_EDMA_CH_IRQ_LOCAL :
+						  DW_EDMA_CH_IRQ_REMOTE;
+}
+
 static int dw_edma_device_config(struct dma_chan *dchan,
 				 struct dma_slave_config *config)
 {
@@ -931,6 +940,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan->configured = false;
 		chan->request = EDMA_REQ_NONE;
 		chan->status = EDMA_ST_IDLE;
+		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
 		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
 		atomic_set(&chan->irq_pending, 0);
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 90ba37737c3a..ff20965db4b2 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -76,6 +76,8 @@ struct dw_edma_chan {
 
 	struct msi_msg			msi;
 
+	enum dw_edma_ch_irq_mode	irq_mode;
+
 	enum dw_edma_request		request;
 	enum dw_edma_status		status;
 	u8				configured;
@@ -259,4 +261,15 @@ dw_edma_core_db_offset(struct dw_edma *dw)
 	return dw->core->db_offset(dw);
 }
 
+static inline bool
+dw_edma_core_ch_ignore_irq(struct dw_edma_chan *chan)
+{
+	struct dw_edma *dw = chan->dw;
+
+	if (dw->chip->flags & DW_EDMA_CHIP_LOCAL)
+		return chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
+	else
+		return chan->irq_mode == DW_EDMA_CH_IRQ_LOCAL;
+}
+
 #endif /* _DW_EDMA_CORE_H */
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index f1abbbacca5e..66a605f28a12 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -255,6 +255,9 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 	for_each_set_bit(pos, &val, total) {
 		chan = &dw->chan[pos + off];
 
+		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
+			continue;
+
 		dw_edma_v0_core_clear_done_int(chan);
 		done(chan);
 
@@ -266,6 +269,9 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 	for_each_set_bit(pos, &val, total) {
 		chan = &dw->chan[pos + off];
 
+		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
+			continue;
+
 		dw_edma_v0_core_clear_abort_int(chan);
 		abort(chan);
 
@@ -353,12 +359,17 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
 			break;
 		}
 	}
-	/* Interrupt unmask - done, abort */
+	/* Interrupt mask/unmask - done, abort */
 	raw_spin_lock_irqsave(&dw->lock, flags);
 
 	tmp = GET_RW_32(dw, chan->dir, int_mask);
-	tmp &= ~FIELD_PREP(EDMA_V0_DONE_INT_MASK, BIT(chan->id));
-	tmp &= ~FIELD_PREP(EDMA_V0_ABORT_INT_MASK, BIT(chan->id));
+	if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE) {
+		tmp |= FIELD_PREP(EDMA_V0_DONE_INT_MASK, BIT(chan->id));
+		tmp |= FIELD_PREP(EDMA_V0_ABORT_INT_MASK, BIT(chan->id));
+	} else {
+		tmp &= ~FIELD_PREP(EDMA_V0_DONE_INT_MASK, BIT(chan->id));
+		tmp &= ~FIELD_PREP(EDMA_V0_ABORT_INT_MASK, BIT(chan->id));
+	}
 	SET_RW_32(dw, chan->dir, int_mask, tmp);
 	/* Linked list error */
 	tmp = GET_RW_32(dw, chan->dir, linked_list_err_en);
@@ -473,7 +484,18 @@ dw_edma_v0_core_ll_data(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 	if (irq) {
 		control |= DW_EDMA_V0_LIE;
 
-		if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
+		/*
+		 * A local instance never issues transfers on a remote-routed
+		 * channel: on CHIP_LOCAL instances, REMOTE routing denotes a
+		 * channel handed over to the remote side, which programs the
+		 * linked list through its own instance. The remote-only
+		 * recipe (LIE|RIE with the local interrupt masked) is thus
+		 * applied by the instance that owns the transfer, and the
+		 * LIE-only write below never executes for a remote-routed
+		 * channel.
+		 */
+		if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) &&
+		    chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE)
 			control |= DW_EDMA_V0_RIE;
 	}
 
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 4df541bf34e4..e9b4bc66886a 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -51,15 +51,22 @@ __dw_ch_regs(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch)
 
 static u32 dw_hdma_v0_core_int_setup(struct dw_edma_chan *chan, u32 val)
 {
-	if (chan->non_ll)
-		val |= HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK;
-	else
-		val &= ~(HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+	val &= ~(HDMA_V0_LOCAL_ABORT_INT_EN | HDMA_V0_REMOTE_ABORT_INT_EN |
+		 HDMA_V0_LOCAL_STOP_INT_EN | HDMA_V0_REMOTE_STOP_INT_EN |
+		 HDMA_V0_ABORT_INT_MASK | HDMA_V0_STOP_INT_MASK);
 
-	val |= HDMA_V0_LOCAL_STOP_INT_EN | HDMA_V0_LOCAL_ABORT_INT_EN;
-	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL))
-		val |= HDMA_V0_REMOTE_STOP_INT_EN |
-		       HDMA_V0_REMOTE_ABORT_INT_EN;
+	/*
+	 * HDMA_INT_STATUS.STOP and .ABORT are latched only when LSIE and
+	 * LAIE are enabled. A remote handler needs those status bits to
+	 * identify the source of the IMWr, so keep local generation enabled
+	 * and mask the local interrupt pins instead.
+	 */
+	val |= HDMA_V0_LOCAL_ABORT_INT_EN | HDMA_V0_LOCAL_STOP_INT_EN;
+
+	if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE)
+		val |= HDMA_V0_REMOTE_ABORT_INT_EN |
+		       HDMA_V0_REMOTE_STOP_INT_EN |
+		       HDMA_V0_ABORT_INT_MASK | HDMA_V0_STOP_INT_MASK;
 
 	return val;
 }
@@ -158,6 +165,8 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 
 	for_each_set_bit(pos, mask, total) {
 		chan = &dw->chan[pos + off];
+		if (unlikely(dw_edma_core_ch_ignore_irq(chan)))
+			continue;
 
 		val = dw_hdma_v0_core_status_int(chan);
 		if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
index da7a5cc93ad4..17cbe7ce55aa 100644
--- a/include/linux/dma/edma.h
+++ b/include/linux/dma/edma.h
@@ -62,6 +62,38 @@ enum dw_edma_chip_flags {
 	DW_EDMA_CHIP_LOCAL	= BIT(0),
 };
 
+/**
+ * enum dw_edma_ch_irq_mode - per-channel interrupt routing control
+ * @DW_EDMA_CH_IRQ_LOCAL:     local interrupt only (edma_int[])
+ * @DW_EDMA_CH_IRQ_REMOTE:    remote interrupt only (IMWr/MSI), without
+ *                            delivering local edma_int[].
+ *
+ * DesignWare EP eDMA can signal interrupts locally through the edma_int[]
+ * bus, and remotely using posted memory writes (IMWr) that may be
+ * interpreted as MSI/MSI-X by the RC.
+ *
+ * For the v0 eDMA linked-list programming path, DMA_*_INT_MASK gates the local
+ * edma_int[] assertion, while there is no dedicated per-channel mask for IMWr
+ * generation. To request a remote-only interrupt, Synopsys recommends setting
+ * both LIE and RIE, and masking the local interrupt in DMA_*_INT_MASK. See the
+ * DesignWare endpoint databook 6.30a, Linked List Mode interrupt handling
+ * ("Software Programming of an Endpoint's LIE and RIE Bits for Linked List
+ * Transfers", Attention).
+ *
+ * A local (DW_EDMA_CHIP_LOCAL) instance never issues transfers on a
+ * remote-routed channel: REMOTE routing on such an instance denotes a channel
+ * handed over to and driven by the remote side, and the recipe above is
+ * applied by the driving instance.
+ *
+ * HDMA linked-list watermark interrupts have the same LWIE/RWIE guidance. HDMA
+ * non-linked-list mode has dedicated local and remote stop/abort interrupt
+ * enables.
+ */
+enum dw_edma_ch_irq_mode {
+	DW_EDMA_CH_IRQ_LOCAL	= 0,
+	DW_EDMA_CH_IRQ_REMOTE,
+};
+
 /**
  * struct dw_edma_chip - representation of DesignWare eDMA controller hardware
  * @dev:		 struct device of the eDMA controller
-- 
2.51.0


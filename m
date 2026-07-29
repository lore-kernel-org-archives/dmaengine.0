Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020108.outbound.protection.outlook.com [52.101.229.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7364D8D92;
	Wed, 29 Jul 2026 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335467; cv=fail; b=TbTMEoIUcSMJkQw1hp0fwm3UAgwuKAUlybnbMKYMtdoTjwcxMONSYymQ75o5NmPGpFcFIkfJthUUnbNtrzAPPXoG8pLc4ejDvJ9x+x1VIpZyg9WtKv3eYkpbnRKdeMeXn/81rmh7jx6hG1UtJk2C3Yy/CFeMM5mgLzoWoe33P3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335467; c=relaxed/simple;
	bh=HTIHDAsf42nCtfpksJGVWXKZZO/zgNAZFHyMA+lMuB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G7/88+KZ4ON7/g/6drdiODenfXjfvLtQ0cJlfaBGFkQrEvnLcl731KLvW1LCIZonAsTwL1b2eVnop2pfvdHfye9Z8xgemZHAbm8sqDh2HR42yNg+SB9qqrJV8T0sTtRHxddc/hj137Rgte73MRah8LBcV3km8U5mSdkobXsGJx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=TztXEnJM; arc=fail smtp.client-ip=52.101.229.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="TztXEnJM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GG201KXQECvplkS0Ei0zJ65dGAduYCCCYEnt6ue2tv0b8WC8w59teV32ArWHUL96L3tlXZTZWRuo8r60dbZX8/wOWgvjHln54B6n5KPzqNJkp2Pk6cozoMJchJ+QtDcWUQwpQDn3XKbdh+ZI6OdiPvLCHgbsRMh87ub580zuPhNhhQUObUKNNJQxcK5h4ArY06eqMYcLZB51IPlDq00n7rSREjyYTeILvi+RizUxWxLJ/i8l2PL2g3fN3teWuW6HSKhC6z9jlWTzxMdGzdRL70KsRS51c4tGyxbGHbbYlTjEzfRD0T8Gj49Av3FnhOl0pD64gB9vpJmUZc0KbTEr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8ZL5elTdLYvQiUKDy4/XduT7qPjZ/ivwQx9GrtuKFA=;
 b=u8IyhMuO8UCd24D/GCoaMQFCzcTlX5Oh1FdiXIHaVpacMr3dQXRaGZzcyWM+ey3Itosrkm8IZeAguWzg1zsJrWen3jMgjTeg7x7N0C547+tpGtBnk5WSm6OsKJoEMbiBb1cKickxq3YsAP5B8ui3Mb4+FtYgIA1CRfYO4M/YJO8gYBmQp4blbILuB/A+qMFDJ5cbdDegwe3RjSAbTCBH6JDBYcl0H5ZEezTLuHhiPCx3O6OqaLb9NAXPQJ2ezrPNtfoRina0GX1gQ3W2dfTr37Y+Ur9G5kxwjCY9oie5HVRXdUDfv46ZboXcLR8nl0apSG2UuiWT7edyU0S96bNXGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8ZL5elTdLYvQiUKDy4/XduT7qPjZ/ivwQx9GrtuKFA=;
 b=TztXEnJMVeAkCivhpskJAfIm6vokSe9i8LcOG5iXAISVVDHCSN6YfH6fP7/79C+ppNxspi4pcPt7y7n8W9SnaXcvkKjYnfGQTqxTcT+s1lOknbS1B3ztvauByQiHp8MLtRQoCh53bh1oqVtP8MnP+78XwJ8DVfFTq2TvzYjfcMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3130.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:291::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 14:30:54 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:54 +0000
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
Subject: [PATCH v4 16/24] dmaengine: dw-edma: Use HDMA watermarks as progress events
Date: Wed, 29 Jul 2026 23:30:28 +0900
Message-ID: <20260729143036.3087722-17-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3130:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0c4ce3-eff9-49b7-dbec-08deed7dff2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|23010399003|1800799024|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4vg5qmH53hkXdSxeehecsPx6mkQa7KTsMPestDHGuX9kJ3PJu68x2edl59ofa5hXJdr04UZRDP0dqiROvdArDNtDqhlY8TM23qT6a13FuuX+7Euapf8phbFLbdQYcWddw7Cd7/f92aMYOTSl0Mkzz5Qoi50QtomqsjGz+ZIcVqzT4qvAdMljgkxHH5RUGxCxbqHaMbiMUJbBFkr2es8zBdunD8RF66xydTJVwYkCraV5YbxD4+w56pm97OpluLfOR8B1jzdWNQykpD+5x4r1upJRelEwdaq75IRFhSmsZPJjEPsWQCBlsrvq4/6jPeSvIcxyT5qJ9mMB37jcQ2woKJtZzPan6oNQ+Ag8MxcXP6QWC2yVTULmXuuQ2XiavPWCvOR/OjUD7KJPJDcqCJlQqY0M19QkTb7+WJQj7TgxiPiI7HV0HuamVevko63G6ALc9WwHfkZW/Bosyrv/lyRo/4ekkv39SmxiV+8ZmfeS7OUYsZlkHBArUZhjZXdUY6LbI3/iWOUQ9tC0fJlABJYuN5USJzc1XKVklqPwh/FIfyngWqgzrx1o3ddFVMSsunjyQAS5mRj/1kpCrM9eygB2uDOBRKDmboXjZbiEPBtK9R8dMyrJLtaRan/N9g6IG1qbkwTAlbCrPaBcct3EVX31MMnJb36m3Ps/HuXCJp+iNq7YS2ZccKozRe57j441e+5WxIkhl2w/8qUg+fv3jiUNPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(23010399003)(1800799024)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?13H+In1TV5cZ8bAdHThzi8T1LZlhQRdJSPSLbQn+nSQ2LExhFkgVrldYqN9V?=
 =?us-ascii?Q?JvxIlb/lHfGY1t5psk8opf1HV2RquYXssZBPE0+XRhDw1EzW9sSvX0GbvkAY?=
 =?us-ascii?Q?DE9WMKuLaSbO+o2Rnp3wDemq7Cb53jHSkvmWhlN2v1j+BytGvNZWEqIJYX/j?=
 =?us-ascii?Q?VFK54Ac4MGKhCOsoZN9RFb2b2NbRq9fedAvyKrlyCW39Ld+RjcWuSW5flPH3?=
 =?us-ascii?Q?rlfzQUzN9mZZa7+vRqJ+QE6G95IS0jEmXEwTjcLLsKLZyBEWeeD7RNOvpSQt?=
 =?us-ascii?Q?VYPuloC0S4/iB32tR4eAkRKGpv8F/RjJ7B9yRx6eQ9xlPLqwUb6UACh0ZVm6?=
 =?us-ascii?Q?QvYDCdxRIxl4bVtQpuWfRQgz412gkippExejFWhjQ+G0xay05SYl58yUO/4r?=
 =?us-ascii?Q?HLdrc6TAINjSIWiiiCGxKqzoYbQXw0PfO/Q751akUbhIf0s1lkszo6Uks1jq?=
 =?us-ascii?Q?VvapGkGrvGZKNP+6P7WSq09ZUMmw+NKaZ28fOJjINJoIG81u2zmnDEkin7Ig?=
 =?us-ascii?Q?lUJ/cQR29SW6gCvw1Sz2EIz0EIcQqOxfXvAqE9IpIRKO1pnrbczHuRnRgTQn?=
 =?us-ascii?Q?lPnM5L4CQbIgsnvNS2B48Qns9dXRSlRCKn/sRISnUglMSDW1qXv2kKm2PLYi?=
 =?us-ascii?Q?a0KMU6xB+caB/IAzGSgt11naiFVy5yN4H09uDr0ycO0goWGyWrNDv/hixwEC?=
 =?us-ascii?Q?Hluqfm6PWEnvWpzcYp2J3ZUhXolx6qbdxq71rBxKlG7+qVrfUWgGfQYbl+6C?=
 =?us-ascii?Q?d05u+PItqZCw5pd+i68/xE8xGYzfCB2m6S92ykETeFwChCcZ09VXoLy5ZUNh?=
 =?us-ascii?Q?C4j4mhs7vdEtEz/VJR+MNqDWw1Hu56lp6WF9Af/MaI6nCu57JoZ0MCDy2+OT?=
 =?us-ascii?Q?6ciRR7/N/tzfi659rrng2bz3xb6wd56LSvBORv5GuVmQovzCXNazYKBkdqUb?=
 =?us-ascii?Q?wbXevpRl1XSlfpQCCjB0HqoQyxBEjD43eOkdIekRpe9LWRDD9YH4pgLddM1J?=
 =?us-ascii?Q?M900938ZwDYjsXl/nD7psqYgtcJkc8+1TdxehPgTfanHwq3gCyXPDLFjS7Eg?=
 =?us-ascii?Q?MhpPZLoSxhISP2t/mICeEaDGG+/pXxk/yFRJ+jSn38AeUoh7YqdTn3zEelpx?=
 =?us-ascii?Q?Adty8Bx3+gUsEYZchq8vPJe0nK9WOIzTtT+s5BwupMoFkDQ54LQm0Aj5qOVT?=
 =?us-ascii?Q?neCvPssNr1FI7UCsApLUnQ0Oo0ct8L42mnfUeUc6mYV7s/FIgs4ZDd3QXs+7?=
 =?us-ascii?Q?cm8ODrFCLa0qE3CPJb5C3Shvjxh5tITgrjE+m8kY+fAvfEtLTNuRaG2pZfjg?=
 =?us-ascii?Q?5cTmW+r5CNYMQqZecC2+Q3V+jjO9DbCBEbFnvDqvoa9hAoVqkY2+k/CLMoTW?=
 =?us-ascii?Q?ZlG2NPnI2GcdaLqQqqOra+5iPs5nuDDCx4HBhGZIKsRIiqWbvD13st4wdXxp?=
 =?us-ascii?Q?bsnlnagKfn/en140FmQ84SHeqbBVQmfwj2WdEtKGrUxAjJotNSUI2rsTwAdU?=
 =?us-ascii?Q?R0WreB+Z+71ci6Ko81bDORI+1ODk2bX5ABRaaAKi2teWOHe4kqgrXe4XOAl3?=
 =?us-ascii?Q?Gu4Yg4lMpyumo9Qr9+wJu9G6M7jAEuQKZyMOIvvPhZpgokh4ZM941+PNdAAM?=
 =?us-ascii?Q?Kj3jaHajxbjbCZPdlqvbGzYa5LcsxVoJUfFl7LZ8jZV5bqDfAagIYKAmAMol?=
 =?us-ascii?Q?7DYiqS7hTFbBtVYlbzGDLMbGb7j8bBgjaoUH0PsVklpnZ3lrTwn7C33SCd3U?=
 =?us-ascii?Q?qmqFvPL5OoT8bUwkLW/G9XJWdLgRrntId3bjcVaoq3wPON9BuVSn?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0c4ce3-eff9-49b7-dbec-08deed7dff2f
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:54.1690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCL5M4hZyp1c+9MUuylx/yArDVavJ4F6Qsdl9haJUI0Y/DK6pakO4yQU8QgYa7dFpCnHPyerFCs/S6RXDlMQdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3130

HDMA reports running LL progress through WATERMARK and channel stop
through STOP. Wire watermark setup, clearing, MSI programming, and
LWIE/RWIE into the core interrupt path. Record WATERMARK as progress;
STOP remains a stopped event.

DWC PCIe Controller Databook 6.10a, Section 7.2.1, permits recycling
LLEs through the watermark LLP. Testing on a 6.30a integration found
that boundary unsafe for DMAengine completion: clients released mappings
while hardware still accessed them. Keep completion one entry behind the
raw LLP. Once the channel has stopped, LLP points to the next entry and
needs no such margin.

Leave EDMA_REQ_STOP and EDMA_REQ_PAUSE to the STOP path instead of
handling their watermark as normal running progress. The eDMA path is
unchanged.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - No changes.

 drivers/dma/dw-edma/dw-hdma-v0-core.c | 69 +++++++++++++++++++++++----
 drivers/dma/dw-edma/dw-hdma-v0-regs.h |  1 +
 2 files changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 0ed4e1b8240a..bfb9f15ac245 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -53,7 +53,8 @@ static u32 dw_hdma_v0_core_int_setup(struct dw_edma_chan *chan, u32 val)
 {
 	val &= ~(HDMA_V0_LOCAL_ABORT_INT_EN | HDMA_V0_REMOTE_ABORT_INT_EN |
 		 HDMA_V0_LOCAL_STOP_INT_EN | HDMA_V0_REMOTE_STOP_INT_EN |
-		 HDMA_V0_ABORT_INT_MASK | HDMA_V0_STOP_INT_MASK);
+		 HDMA_V0_ABORT_INT_MASK | HDMA_V0_WATERMARK_INT_MASK |
+		 HDMA_V0_STOP_INT_MASK);
 
 	/*
 	 * HDMA_INT_STATUS.STOP and .ABORT are latched only when LSIE and
@@ -63,10 +64,14 @@ static u32 dw_hdma_v0_core_int_setup(struct dw_edma_chan *chan, u32 val)
 	 */
 	val |= HDMA_V0_LOCAL_ABORT_INT_EN | HDMA_V0_LOCAL_STOP_INT_EN;
 
-	if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE)
+	if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE) {
+		if (!chan->non_ll)
+			val |= HDMA_V0_WATERMARK_INT_MASK;
+
 		val |= HDMA_V0_REMOTE_ABORT_INT_EN |
 		       HDMA_V0_REMOTE_STOP_INT_EN |
 		       HDMA_V0_ABORT_INT_MASK | HDMA_V0_STOP_INT_MASK;
+	}
 
 	return val;
 }
@@ -76,10 +81,12 @@ static void dw_hdma_v0_core_ch_off(struct dw_edma *dw, enum dw_edma_dir dir,
 				   u16 id)
 {
 	SET_CH_32(dw, dir, id, int_setup,
-		  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+		  HDMA_V0_STOP_INT_MASK | HDMA_V0_WATERMARK_INT_MASK |
+		  HDMA_V0_ABORT_INT_MASK);
 	SET_CH_32(dw, dir, id, ch_en, 0);
 	SET_CH_32(dw, dir, id, int_clear,
-		  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+		  HDMA_V0_STOP_INT_MASK | HDMA_V0_WATERMARK_INT_MASK |
+		  HDMA_V0_ABORT_INT_MASK);
 }
 
 static void dw_hdma_v0_core_off(struct dw_edma *dw)
@@ -90,18 +97,26 @@ static void dw_hdma_v0_core_off(struct dw_edma *dw)
 	dir = EDMA_DIR_WRITE;
 	for (id = 0; id < dw->wr_ch_cnt; id++) {
 		SET_CH_32(dw, dir, id, int_setup,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, int_clear,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, ch_en, 0);
 	}
 
 	dir = EDMA_DIR_READ;
 	for (id = 0; id < dw->rd_ch_cnt; id++) {
 		SET_CH_32(dw, dir, id, int_setup,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, int_clear,
-			  HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK);
+			  HDMA_V0_STOP_INT_MASK |
+			  HDMA_V0_WATERMARK_INT_MASK |
+			  HDMA_V0_ABORT_INT_MASK);
 		SET_CH_32(dw, dir, id, ch_en, 0);
 	}
 }
@@ -158,6 +173,22 @@ static void dw_hdma_v0_core_clear_done_int(struct dw_edma_chan *chan)
 	SET_CH_32(dw, chan->dir, chan->id, int_clear, HDMA_V0_STOP_INT_MASK);
 }
 
+static void dw_hdma_v0_core_clear_watermark_int(struct dw_edma_chan *chan)
+{
+	struct dw_edma *dw = chan->dw;
+
+	SET_CH_32(dw, chan->dir, chan->id, int_clear,
+		  HDMA_V0_WATERMARK_INT_MASK);
+}
+
+static void dw_hdma_v0_core_clear_ll_int(struct dw_edma_chan *chan)
+{
+	struct dw_edma *dw = chan->dw;
+
+	SET_CH_32(dw, chan->dir, chan->id, int_clear,
+		  HDMA_V0_STOP_INT_MASK | HDMA_V0_WATERMARK_INT_MASK);
+}
+
 static void dw_hdma_v0_core_clear_abort_int(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -214,6 +245,12 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 				dw_hdma_v0_core_clear_done_int(chan);
 			}
 
+			if (FIELD_GET(HDMA_V0_WATERMARK_INT_MASK, val)) {
+				if (!(events & DW_EDMA_IRQ_STOP))
+					events |= DW_EDMA_IRQ_PROGRESS;
+				dw_hdma_v0_core_clear_watermark_int(chan);
+			}
+
 			if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
 				events |= DW_EDMA_IRQ_ABORT;
 				dw_edma_abort_event_mark(chan);
@@ -282,7 +319,7 @@ static void dw_hdma_v0_core_ch_enable(struct dw_edma_chan *chan)
 
 	/* Enable engine */
 	SET_CH_32(dw, chan->dir, chan->id, ch_en, BIT(0));
-	/* Interrupt unmask - stop, abort */
+	/* Interrupt unmask - stop, watermark, abort */
 	tmp = GET_CH_32(dw, chan->dir, chan->id, int_setup);
 	tmp = dw_hdma_v0_core_int_setup(chan, tmp);
 	SET_CH_32(dw, chan->dir, chan->id, int_setup, tmp);
@@ -343,6 +380,11 @@ static void dw_hdma_v0_core_ch_config(struct dw_edma_chan *chan)
 	/* MSI done addr - low, high */
 	SET_CH_32(dw, chan->dir, chan->id, msi_stop.lsb, chan->msi.address_lo);
 	SET_CH_32(dw, chan->dir, chan->id, msi_stop.msb, chan->msi.address_hi);
+	/* MSI watermark addr - low, high */
+	SET_CH_32(dw, chan->dir, chan->id, msi_watermark.lsb,
+		  chan->msi.address_lo);
+	SET_CH_32(dw, chan->dir, chan->id, msi_watermark.msb,
+		  chan->msi.address_hi);
 	/* MSI abort addr - low, high */
 	SET_CH_32(dw, chan->dir, chan->id, msi_abort.lsb, chan->msi.address_lo);
 	SET_CH_32(dw, chan->dir, chan->id, msi_abort.msb, chan->msi.address_hi);
@@ -362,6 +404,13 @@ dw_hdma_v0_core_ll_data(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 	if (cb)
 		control |= DW_HDMA_V0_CB;
 
+	if (irq) {
+		control |= DW_HDMA_V0_LWIE;
+
+		if (chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE)
+			control |= DW_HDMA_V0_RWIE;
+	}
+
 	dw_hdma_v0_write_ll_data(chan, idx, control, burst->sz, burst->sar,
 				 burst->dar);
 }
@@ -443,7 +492,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.ll_link = dw_hdma_v0_core_ll_link,
 	.ll_clear = dw_hdma_v0_core_ll_clear,
 	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
-	.ll_irq_clear = dw_hdma_v0_core_clear_done_int,
+	.ll_irq_clear = dw_hdma_v0_core_clear_ll_int,
 	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
 	.ch_enable = dw_hdma_v0_core_ch_enable,
 	.ch_config = dw_hdma_v0_core_ch_config,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-regs.h b/drivers/dma/dw-edma/dw-hdma-v0-regs.h
index 2124c162a62f..60dc054adafa 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-regs.h
+++ b/drivers/dma/dw-edma/dw-hdma-v0-regs.h
@@ -18,6 +18,7 @@
 #define HDMA_V0_LOCAL_STOP_INT_EN		BIT(4)
 #define HDMA_V0_REMOTE_STOP_INT_EN		BIT(3)
 #define HDMA_V0_ABORT_INT_MASK			BIT(2)
+#define HDMA_V0_WATERMARK_INT_MASK		BIT(1)
 #define HDMA_V0_STOP_INT_MASK			BIT(0)
 #define HDMA_V0_LINKLIST_EN			BIT(0)
 #define HDMA_V0_CONSUMER_CYCLE_STAT		BIT(1)
-- 
2.51.0


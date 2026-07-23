Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021140.outbound.protection.outlook.com [52.101.125.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA7040B0E6;
	Thu, 23 Jul 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796128; cv=fail; b=bNHncSDJFLouMVUW/Lda2IpqVu2fsrNyfUopc2ogNILCTyTG0Z4FD3pxVXFyhxOnRqkVW8aqgrfAzEJ6pjlh1KWrkpPM9mLRza1BqQgEIuRaLyseDPw8QXPWrtFPQCeER5zWbVVuydMF8DSK2GF3vdjt5FnV7jRqUJSkfrSUhgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796128; c=relaxed/simple;
	bh=0mrrSFZILF6T3vLrCNtSxYGnT8F7K/qsNhCpTlxwW3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J9Kp8LU4k3GeXG1Rr3U+nKoLai/ptFRAurMV42RkvTXBvB4TfpAMOjEk2jOaFPBIwgtY1BSPpF+jH1WMllLawavKteJ561iEMhVx7hDMcsQSNA52NJh5J47qInESwdzuV3wXGYm6mnPIA5v3aGzAPAGN4dwkAqIqPH8sPNfeTO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=YHcDBlIl; arc=fail smtp.client-ip=52.101.125.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="YHcDBlIl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKrpodycO/NT7n8WC91k9tx7GRNdXFDQUBOEvX7hWxAH9KyBjAbBWkAzCorfRvkwTLzczQv1a72eTcFS97f8NqeabpcwirgnTpxnBE1ds/4VcWO3cFMU9r1Lcuep3a/ygsANXhDGJQ6ts1Ko3ov7cu71xJxJfNPaip5qe0w515WBE1hUDuAdNmFBJQMlu04+t7kv41OaR+XEE45opAM9dUOVH8Cbc6R8mT+28+3F2mAjehXKAAxCw4nRJ/JwSGUEAHIVH2P5O58Y05AvK6mIgrXmSModbDMyFuIHL3pfSnldG3Z+Uf2U205vOZ4Gw/sLCk728lBOe2odoUrjLprm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xK9QTXg1pcmnL0V0+9FaV6UUQZMs60vXvEhC7dtcpuY=;
 b=lPZUYQVaNCdRQzvM3k3bYndOvdb498TGgTLwywdhQyw96uZhIexB8BRPbBShlKPIMjIAJmHj7XNCnwFPkjSzqIh3NkScLvZ+nnUdExQ4fsJYAxtik6i3n5ZCP8mSnhCCDxkwXUVQsNfhn7kKofEKI/6d5n2Bx2QGMBEDVoiIT237N/az+Me3c221sK2fW/QdnihlArx9x0ppzI3jkfGezQTzC5rZZ1HaRRLeQgKst29nmNQSMKqgU30YRejBokE8mQxcpAjz0RIoAyVEZu7vxvTrVCd0hYAxkuG7xlLnjPwyxqYkECUXpUrUcUh4wk4e5fyP9q47h014dKlZEGEN4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xK9QTXg1pcmnL0V0+9FaV6UUQZMs60vXvEhC7dtcpuY=;
 b=YHcDBlIljtneQwRfsxyblfXQsZVI41GF+VpKZ6FzgnR1WQbbCPAy37V5JHyR8lmr7+4rKYTRKXXLnxpNGk5Q3j2x8FxDl3EeLY5TBuK6BPYIGgUsKesJ+Yk+YNs+xDrL/P52KsPnoxTrLu4Ai/sh4+3zYBKDsBDgJ6iVHLgxiXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:41:58 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:41:58 +0000
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
Subject: [PATCH v2 03/19] dmaengine: dw-edma: Factor out linked-list transfer start
Date: Thu, 23 Jul 2026 17:41:34 +0900
Message-ID: <20260723084150.521366-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::15) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2f0eae-ed6d-46fc-1c54-08dee8964216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	t+kisg+lC8qY5Vs5yoc3TGsdrbgSrcRIN9FAVELklA+V7iYc5lD4y+N5gP+kA42eIazgjfayuwCN5toOzhKtGJMatXfaEARdqcamxL/418onAlWFloZYkfK50tgxMYlUPx5J9nxqr6BsjOYtkUMhJd1Tp/YXVMU1m22NsJ/tvBAXAU2OHDWa7Vxjuuins9JGDqv+M4sU9A7AAwyn0vyEjDKlcjWf1RrYlm8Mk2/xeTvVzXZoMK8h25dyxY+6vWJ2HeAEzNnMICE9quvSzfPJZPTI7KkZuqCvCHM843jhW0qGozECvEIQjbmaWs5gbuooav13xfzMazPEPz3Y93fIEcM5m5SLjkvYwJa193NqQPYU1fZ/E3lZjKUF2aWYJRbZxpppwik1RFyCXliZ1d3L6tQcXYTI3uzwMpeAK45jsI+6Q8teEozKoQz7lV+dUbRXJPvIEYPkdLEMjdk88zZ9KbbFnm6EpYaFgNMYm8ORKt9PNeX9s42UrTLZS8Car0r1zRekZFPn62rqGgtE1eyHD8mFOQoMo0MNDdpaIR081dGvOJspe6OT9pTMJyzwW4XheQRIdL3/L0//8p4yTz85Z8G3IPD2js2q0F3Q25/KVD45Idcbv8f3p8FPgkChEJVvtJVkHnD/bKDXlu+xJjw5t/HtDKkopi6Dt5j79wx7PA+bhkQbxwdxlKpQARZqhmFpGqR3KkhtA1VcsCzXrKxP/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ei6onSmks46vGU1nqgqVnikk59Yl1ksnpQ0eoAdrpNk9nadWfh198sEl4tRJ?=
 =?us-ascii?Q?E7I3o77wO5xZKgdYau82C8w1Ge0dCWWiuVp/CJRBPOHbBwx8FcPXuAGSit57?=
 =?us-ascii?Q?Hiq4DHO/NYuaFB+0lMermLkHL+BgtT38pnjGUJuXHKcx5gQeTpx6GeE5XVb5?=
 =?us-ascii?Q?9r2JdmJvwmXZgTtEVjEpEbOrvL+IJXyhDR7M34fNxZW9XGcaFFoibTwewAKb?=
 =?us-ascii?Q?sxJaaZNDfZ/RMMQfZ5/6tzCjnLZJcohF9qRh/x1DhEaYYJMf7tlPKGqNv9zj?=
 =?us-ascii?Q?oDZkC1+lmA9NRWqPYC/oGuV7eyjvw4FYvzVbXQEKDzqI1LQ6fm5BUhSeaH0T?=
 =?us-ascii?Q?WFIhwLyamvjXxXC28uLiBNgzmqAgIjOQwuhLs82bSVlU0wmVR91r5jrhuxRG?=
 =?us-ascii?Q?oM1Jvv5Pg0wKo/snE2QrgkPDVxt8yg1O8Mevj4T9LsJ/ktyzZ2d0PglYrq5x?=
 =?us-ascii?Q?EE7w7ELSBwB5OqAwcd7VQGr/lSGs7cuN0yopJWblqABizRHh4IyXZv1xJgkl?=
 =?us-ascii?Q?IQH36xDwjgJG5C0AJhMx5RYNlh4wksfwGhcEr2P8Dx3433GYQz5w8Gw1H7JG?=
 =?us-ascii?Q?Ksotgd2qwwrEFNPEGx+coadIfEn6aJC7QViwKY9poeI5XetdV2oBrz4r7IYd?=
 =?us-ascii?Q?dO8QosUdoFo8C8FAwZAgn8PcLuCDq4A0CeSglmTbc4kqiQzTAqf5Tp99dmRl?=
 =?us-ascii?Q?5iwayNr23Iv5nlubUpG5Y6lXgRHJ7f0OmMNMPUkTFcQ+ZZUTpmcKrpOYYvhp?=
 =?us-ascii?Q?tVWwo2zOdj+1Iyl2Pb0cTfpDVvKe8UT8FlffZMhetPvJW3dunI9dco5vqVVS?=
 =?us-ascii?Q?m3hu+88udhMMngkxQIQmOt7Xaw5mF2OoT5dsQKtnieoj43H1wtX2UZ+g6f42?=
 =?us-ascii?Q?uarxVJi/8M0QjrML4k/ecc0Pupns5AquQRPhNXWsk/hI+bt0TnuC4YmvZq8a?=
 =?us-ascii?Q?34efZDovBzM1ntD6qANObxftPAYpq8zCpDOwokv1RX0yhuuBt9RbsBXHNNAQ?=
 =?us-ascii?Q?rnUbmMdhq5d3QFKZ6Hz6avptml6bub2ztjiFkH/Mlux2BovOyhDkXWcPrcLD?=
 =?us-ascii?Q?f9dIKUAOKzWeudqPWbY1l95dN9JWniysfBizFwOjFwaIjCbMbIyTsgiqVIdZ?=
 =?us-ascii?Q?0hzVqFt0zTFfm6uJrkgXD1PdaxZWHsSxKSwJsV+viWiWobYaOd3iKcqKv9aK?=
 =?us-ascii?Q?mSrjroX8e/4esilZ7WUGkUsP1/ueKqikUg1/enRPHBsoHaHDp3R3/zb3lpOm?=
 =?us-ascii?Q?MvpWhmVDLxaNhRDogAESyYmWvtRQf4M/cJpGI/Vwh+VnUOrg9hpHZT+2A7tt?=
 =?us-ascii?Q?BocMxkOd8yQhn2wnLcoXtFIYUy1QYCzonY/Wj79Yjzjz2s4+t4M9yIuOW2yH?=
 =?us-ascii?Q?HnVGzA/A8qAMjX3RjoW+5K5aYi+PFrcRC1Z0i05DVFQiyZPTIzevVVusB7yQ?=
 =?us-ascii?Q?HHXJZavF9lHXNyd0oBEcoEKSBkWKxj54rxeOTOYtX0amkAGCg5Zoy2oqj2Bd?=
 =?us-ascii?Q?LPcIQ9OyZKAjevOggFKtlWnTAGcupEL34XcpdMPpk+JbgiOyG4auji7VLhuQ?=
 =?us-ascii?Q?k6Xg+WGAzSf6geFdemCPaHwX/53gHR2ZFED9EK5KlfdX8O4GHiwdWjqWdRRX?=
 =?us-ascii?Q?Y/9kvvYzXR625+lIs7ujDgidz8EEdtM0UVLVALjhD1PiZWQ7DVXX3kkMHJT3?=
 =?us-ascii?Q?zaT2bRGSJlK97SSxbYNrvYeewjXxdMYsq8lw4/dSdqJrF48hcfzZY+Sl0ADV?=
 =?us-ascii?Q?E+4JUI1j/vbNq34i6t9AzwiMvbINsEEgMJLkfPwvIeFbu/VND08t?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2f0eae-ed6d-46fc-1c54-08dee8964216
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:41:58.5463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bR4ya8JRSG0c5Z5LZDZuQMtPev9GRVnWt5B1qAdUsdjPI+Vx8rJiF500/FU9yZHXEXz3FrD6Sp6DPN/t72bwEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

Move linked-list programming into dw_edma_core_ll_start(). It can derive
the first-batch state from desc->start_burst, so dw_edma_core_start() no
longer needs a pass-through argument.

No functional change intended.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - New patch.

 drivers/dma/dw-edma/dw-edma-core.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 1f893dc54c79..6a25a050b89c 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -67,17 +67,11 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
 	kfree(vd2dw_edma_desc(vdesc));
 }
 
-static void dw_edma_core_start(struct dw_edma_desc *desc, bool first)
+static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 {
 	struct dw_edma_chan *chan = desc->chan;
-	size_t i = 0;
-
-	if (chan->non_ll) {
-		chan->dw->core->non_ll_start(chan, &desc->burst[desc->start_burst]);
-		desc->done_burst = desc->start_burst;
-		desc->start_burst += 1;
-		return;
-	}
+	size_t i;
+	bool first = !desc->start_burst;
 
 	for (i = 0; i + desc->start_burst < desc->nburst; i++) {
 		u32 idx = i + desc->start_burst;
@@ -101,6 +95,21 @@ static void dw_edma_core_start(struct dw_edma_desc *desc, bool first)
 	dw_edma_core_ch_doorbell(chan);
 }
 
+static void dw_edma_core_start(struct dw_edma_desc *desc)
+{
+	struct dw_edma_chan *chan = desc->chan;
+
+	if (chan->non_ll) {
+		chan->dw->core->non_ll_start(chan,
+					     &desc->burst[desc->start_burst]);
+		desc->done_burst = desc->start_burst;
+		desc->start_burst += 1;
+		return;
+	}
+
+	dw_edma_core_ll_start(desc);
+}
+
 static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
@@ -114,7 +123,7 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 	if (!desc)
 		return 0;
 
-	dw_edma_core_start(desc, !desc->start_burst);
+	dw_edma_core_start(desc);
 
 	desc->cb = !desc->cb;
 
-- 
2.51.0


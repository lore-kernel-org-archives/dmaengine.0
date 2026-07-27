Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021072.outbound.protection.outlook.com [40.107.74.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16E942DA3F;
	Mon, 27 Jul 2026 17:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171820; cv=fail; b=DhA/ScQ0X4hS2wsEAaTY+eV/aTORuWtP201ET3jMhJ2U6sS6MiyJz5Ibnc8b2nGZXhUXQI3sEX9lnu3wMQ/Be9piTWMASi1ZJsxC943KPlohnOzzXTf4z9QzI7DvLvEYRz1IJafsg+KK58ELg3hxQO80XYDeMlUot3hgGtUT6i0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171820; c=relaxed/simple;
	bh=6Lrit6CSj7vW/NdzFLNB02m7JUeVH/dkwPHykbw/LUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pUgyxt3Q78TaWzyKu1ESliR9f1s1Wky9zk/QJ4PyeCNNUkmG4YbSl3XwTVvDr5HwBi/ESNmG8KWGulaHzta0RI/1Z1gSDPTpZAjTURdyY50K1U8J+lUCNi0+/9UtOImJn9+T1iPhXYqamj+unW5Ph8dIoykk4oOZV4KypdJMZXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=SZIdoG9T; arc=fail smtp.client-ip=40.107.74.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="SZIdoG9T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lm/Ds2psjo6LEUdTcpwsgdn8aNUu3lGfPjyO9AsIx9ZC7f3xWRHTAJ2xNQPVMbxjrOJ+ZHaoSlBA6bsIzGGJwtPDcMyqR6aNoEBszwV9MOkdmJjs++2qXvwiKMK359NWt5lQWGsifewvrr1QLxRvs9PdG3pQ7a1n1ocsjJBf0Hy5K4Uz33ARsiGXEhikwhDwNxeHlgjeJsQUTGbZPvh+1wu5jQGQYjBrjoLxZBNYQpOC15z9bxv7KIGojJCZC1Pum4x+z4/rR3oY8SNXXVv50b/gS5Dz/Kb4XW2qVNlQkOYEy6Lk4OVW7rS/ahWbHwfPWyVRtr6HKbJXgJ9eU1s3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l88WxIchjX3SWUtBZiIm0HrtfUYkK1cXPyjtxAzqRNY=;
 b=Itasg4zCXYHy8y4tx3qGpicXCMwRKEEHQcpoQJNDpb0RuLVURmTpC5dRenLmtHe/7Nc7IDoEw5E858dfnvipCrDMSw1uRTgge+o2uX3R2tmBWuZdWYMxez0iJ6QNGme5XZhnGEaHsg3z0Ay7z5F7yQpRPt4Mgu6ud+TWsDSPsP1GPy2ezwNOiweVxkRVOLC3iETYYWJ0/cQDwEXHAmLAqHTyyLDCyqXqW1s56eMVIIzR8RIBKshQtSHRz4h9CTVo75XNJ07tuw+2SD4EXrYGKgAVildDcJeMhybehbFREbpyoQwmXukQipUQQwcBu+gL10HfQRp4cri2GQYc3sno/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l88WxIchjX3SWUtBZiIm0HrtfUYkK1cXPyjtxAzqRNY=;
 b=SZIdoG9TGTYtgeJIosz+yVrPq/c72iJgbUXaTsr4ms6APbuwefoPWdyYwaOYT4JcezlBzlanrogL99xMTB7TOu47gzBfaH+W0Ob4NKsgb6n7x0xAYOhy7tt1xu/ybA6HNTdu3VBsnj8yHfDPY5nLocoyzaZwAqp3+I+POmWEWw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:33 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:33 +0000
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
Subject: [PATCH v3 03/24] dmaengine: dw-edma: Factor out linked-list transfer start
Date: Tue, 28 Jul 2026 02:03:02 +0900
Message-ID: <20260727170323.2321369-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0011.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7c1ccc-a4cb-49aa-7527-08deec00fde2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|23010399003|7416014|1800799024|366016|921020|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QJKdWiKuDtigkCxFWN9n+43PVb8x9iBt3I/pHEwC6Ki5g0i3l7n8ClcZiIoXCobL5CyWrIWg1+unctO0uzYCyG9CtkiOvgxB+iv7i8tn8F+5I1nHQQ8IOpPyGhL7MZjVhMen4V0doUYJ8n3H2hu6U+9r8i/V/kUycuKc0hDfhj0e60pmdaMiPEM6bJNvwsMD/5zuyK7ObGaBGVe1kiWdUQZqnWfFg1nAFSUl25TemcpwL/yNOpm9GgqQ5t385IwFZ1WmYOTmNF+A5VXlgXNaQWeYjb52MyKt5LY7SXPnkxBgapmcaYHIYFpuiit/9H1DxM84Y8IiHEbvkq31tiRYCP/m7E/dc7TZldbkJnlhcDhTpBpJhu8BloRuKRVxuieyPjKq7eOahzgvXa5TUh2hjBJjb+aqDR+YVZApaI9/oVsmieXYkUMmSRTj5NCyyuQzFxjqCQD24iHtF1qBKu32XUsNCg891FNoNmmAODI5w7+hn2M4r2FtfrAOF9fE1gQ1OtsVt3O/tzwx2TD//XC6fen/ko8Ql/+vlod3ATXSxSw/hADm94Uv7DXTl+dXNN/2YtjhwVwsq+ENxhrDE6f/yi1+9wa8GnUFRgiCHJKldE1tUtPYbIjqdwMlL+OQs7iqYTOCIjzlKyabs6VR0DuDCM+AxLhmdUJxDcrgy6VDGKMNxoy3/QwZNt1hSh/hkudYgbK6zeRVklv/n4lQrrz3Qg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(7416014)(1800799024)(366016)(921020)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q5/st56HcfF9fQbSApJeSlWSe42kL8FThM2DvHG9pkZ+Svv1XazHY4QGcPmj?=
 =?us-ascii?Q?utLVxwCEVIuUFXM6wR9MEbVhXAjbZyaUegygDOATWf29QpUD3CScoaaaKh9x?=
 =?us-ascii?Q?PaeMj/AAE9ziv8CqTiJfO/MjoFJ/RqfTbItIj3222vDWBEDeASPSHk79JmTK?=
 =?us-ascii?Q?qcmFrcd8ts8p8cbLS8KtjEEVfaMaFqVVzR61vX4Sjq+W+hB8RS8PDRE/2LqM?=
 =?us-ascii?Q?xxBKe4lfD0JiQGrERJ/pCO5eKWByeZDT8eQBJXrM3h/8AHyxZTSH50eL4WDS?=
 =?us-ascii?Q?r50tXKmI4idpkpaMuJBg3HxMkqYsEc68idwlcO1cLMyX1p/fjAoXjxzt2AxZ?=
 =?us-ascii?Q?yuGqQY717O6awLnNRwN/AEg0FSGExu02cBt8dM1s4/G7yCzNCj+uvYPClsHP?=
 =?us-ascii?Q?Sq9Ku6qWA2CzCfiZQgwpZQ1TZZjQrp4XEnQ+JXEkeHlxA6TR3pFfLPpHe0dH?=
 =?us-ascii?Q?FWYpxmE5q6tGNZBcpfPSZWzETY5sluAdMXbVuQAiYxuou1f/bwibCFc6nrJE?=
 =?us-ascii?Q?xMyrQbS9RaK0aWkxaHFv2jHD6S7NRGAdgviDbouSyHx5Zv56scvexFDTqfB4?=
 =?us-ascii?Q?DyqE0IyPM2tzcJ6aCoF8EDDTunar1JQb38a1gt0TpH6ISZ1E7DoeetqbfWg/?=
 =?us-ascii?Q?+23YUWpXaSSMsxbGo4nCUjSzD7xYa5pvY8D0lNgFjBaJZIRjWn7SUm/Lo/E5?=
 =?us-ascii?Q?+EwG9JwWdu0S4dVdjBSQM8zRIC3owcBEq+63aQsYAZ0xDtywNXL190zORbV9?=
 =?us-ascii?Q?s2yXfdc2gUP5/y3BJcE3fsx+MyUbwALw68j+jmVwxFzfvjXyQXl1zElprYue?=
 =?us-ascii?Q?p//52zCqeZvBCpYwESMI8aKNeSJv5lTUqUvRytoxKrkRewHif+1SgZIFzE/P?=
 =?us-ascii?Q?qSQO1cbmhuDgYyVqibqv3t6syyztZwcvPMG11z9emo37lU/828o8Vc9c/rIx?=
 =?us-ascii?Q?07fOppbLLQPkWnhMAL8CTP1mjrU0Uj6aQ9v++ZrDP/0cbpJlrq+yx12bg8jc?=
 =?us-ascii?Q?KKycYyxKAtJlOwlejijmEYsYd0Z6S06kVFpjIXnetiNNwxl8wqdGANwFC/xg?=
 =?us-ascii?Q?diwLaYw5pyeFi/qUNm/0GhEAriNdTlEAmvbaewIlw81sJQ/e2E+tEVrvShIw?=
 =?us-ascii?Q?BPdiLmVWdRUSRajQmVTJMgtobcLO4vBMJCRgjTucknUA+4al/95UwFSjUQrj?=
 =?us-ascii?Q?ajqR86QaHVul6YZSvXSo+NBlNWzQpae9MeHavMeQRsr57TGWswmCaZvB+3rr?=
 =?us-ascii?Q?ShuYvULhOaOVm45+RHmQzfiQJDxY9NKWCsjOoiOkhjq7k4Z2czzBxaV97Lyu?=
 =?us-ascii?Q?DyuYo0OH5QByaeiYpft66wQ3yOqw1b+JmoPnAeA87il1xnR+L60xhaETt97n?=
 =?us-ascii?Q?ajxXNvcNTR/il31px3Bch89EWF61z1kKQUPnlCcOQltIhza00ISFzI+4hxNE?=
 =?us-ascii?Q?9mFKdfCSjK4j9q9TKdLId+a+kAQBrZ4F82N8uQbJfp8dNrgorwmoK+qVRW+s?=
 =?us-ascii?Q?goZrTGhgxg00YxL+uUNpplxLJE8SfNz//5S2q1AC7NPA6MU+gZyXAyqfqOHu?=
 =?us-ascii?Q?oijxsXtbX0vMfttcK9yqi4uAHDGpjy+r117AEFswh9lG/agMDZhJnPhpz529?=
 =?us-ascii?Q?9bVxF//ZaUp5yoG8bfE5SoKslKNLFaVIGEKBqu40COnUgs8MqUaNO+bzFZsu?=
 =?us-ascii?Q?hZzpHXP9n48SAJiuzFvVX9EeuegOLqoa56nbvw7wmyAcfP4csJMeujwVzdIw?=
 =?us-ascii?Q?YyrUbXCCKn/UYOFEcUtzVUQ7TImh06lSZsRyvSfmNGrHRaUnJX2E?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7c1ccc-a4cb-49aa-7527-08deec00fde2
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:33.7231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luD88hhy6yZttEhsCCfkOuWMkH5pMLeTqI+aP9IRcgSDDNzBowWCOYLiXBzkSW8zVO7/qAtoLMfCtf4grIFMXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

Move linked-list programming into dw_edma_core_ll_start(). It can derive
the first-batch state from desc->start_burst, so dw_edma_core_start() no
longer needs a pass-through argument.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - No changes.

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


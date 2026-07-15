Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021115.outbound.protection.outlook.com [52.101.125.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E7547DF8B;
	Wed, 15 Jul 2026 17:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138280; cv=fail; b=AcqrvJ+nJLZ1xaHnSQz1g+j3BRm/Xqmqs+8JF5l4nJGdoFqIFvgnqTXVOQcwaRfJeiKRi36kWoVxJGcHGwuISQVAHE//LzL6j8moxqJ9M+dILJFOGSPPhrNJxIldf9y5a2ZLAMC262c4u39KTyZRjRlfcYuT1D/J569WyjMeqOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138280; c=relaxed/simple;
	bh=xBcjbOJ1WCeD1IsoQgUsRAPDr3kpmpDHr8e3NLhnjFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N27TpMmKbeGxk3XfyfC40HZ5okV2NFeikD/mxru4nlytkCOA122tOleBSCaUxZUF7LAeFH5P1C1JfjCzXkYvWArM2V+3usBkt7Pa5uE9g/CfhcE9cZQgbEIfT4Vr9imqTW9iJisAUVefK7BsC/Fm2aJwCBUVhr18S9Ri77dkruY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=sShwQLNt; arc=fail smtp.client-ip=52.101.125.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="sShwQLNt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRE2CUDqhKoaPK6J/TqouOI4xKlduBR6tSIcmlbpkIrum37lsYGKpF2iqi2gK2XEOCTiSZ0KE04HPdaIOWgvNyFPggvSy5MluLBCCvopg4pRzjWNSOfgDgdnvM9JzotTqXyd/UEBBUsuLUGwhI56VSoxcEyipRu2uhRDQlM4duBJw2Tfw8c4UPKzhC9j8KtM0tg909DJ3WoEUmL1ncx7wJ4FuHEjhSwvGSfUI3LbxahWF8UzoatZacIJfkUsXoy7ctfwx9JQ0sOTjNZQMkx/FAARpkC6yQzJ+D3jJww0paaALxdRj91Gyfwz+bJjye58TyzCBmU5qqssbliJvspcgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6U2K/BIgc5kxUuLtAiWWSfFW0lcYIVTsrpF9WxdPPE=;
 b=aeX+hY3gJZFA/b57BERn3JpgtLlPjzoQ8KBvH46X5tPmTOn+BjekLifS7Q1379I35T+80983GwafRvfqDzuuxemILj6v3MiJIto3paBILwhJj55eSmatMVVg09N8CCpg8VrWGB29s7tninr8pedkTkqgSCz3BBu4SGVPeve1+Gbahlz3VYqMiZLzPOwM1GcBVsR9RN3I9oPloOuJfEbxQAqXEgVFIBIj8XXPyg5eienotaQnGXr6ZbNZIrGFHYKlWLNrPJe7atQ0J8QwZJwu/MBRi4NaFDknHEySVgf9ppTcRXE1OqLq9CpQizI+ZeOY5L2TevHDNJUIMB40O8K9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6U2K/BIgc5kxUuLtAiWWSfFW0lcYIVTsrpF9WxdPPE=;
 b=sShwQLNtJnmNMiF98JlrRPcd0iFr89qb6H2AkZotk6PcpJSg46ahE4zY1kArxV9HfA0cwys5wDkq23mdafxMoMQRyOj0Uq0hJrEMVA6sCyYRgYtr3Epj6fqfbUfSBfk1Y5TB25J9zSdTlrS28V4SZNLXhRWW4QtvuGPLjrJkGWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4406.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 17:57:48 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 17:57:48 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/9] dmaengine: dw-edma: Clear stale requests on termination
Date: Thu, 16 Jul 2026 02:57:37 +0900
Message-ID: <20260715175740.1110404-7-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260715175740.1110404-1-den@valinux.co.jp>
References: <20260715175740.1110404-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d36fbe9-3d6f-4c5f-4a6c-08dee29a949f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|56012099006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uUoV60eGLEaZQn/msyUCA9tiPwTJzi5tFN5tHUbN9/tnmJ7MdiCi5zdoa0arJgJgvIT8MrGbyXNMVXllj5y4zzGoNIbGF4IvtiJz3h2ozZF5EK/sq4iOqZEca7miO7T5qx8Fm3JizbAIN180WByTLg6BU6LhCPBH3SmhBWlfBQWUyPRaqFtr8lJmH9jkc8AVv5mleYxg4TgE3Csp7pTtpcwmS3LkWWnIXzHn1dheBLxLQ8eJr9R61DIaJijcOp82VwV++1JKgYWlNzuo/WOqKvgXjRKQbNcAe+BGnOncCTY6XlFXrgtcFhnVC7/46GnF4OW/gLW09hbWUQ/6fPYSkR+uiWXv30Yp2JTORld8ikiv4+QSYlsTvxYLGraEDOps9UBQsdo/X02rhnLFXiUND9lCJqRzT+pF/ghY65aQf2jXJe5vIvRZ6+sPjoAUj2VNLzBNkSPaTizbneEIqsmIjH+lvfEKLBGz5RjUq49VjVdlOxU2aUYSrtp1NGy0BdqLAQ4L7fQYIyu75cdPqpzgAgGEZVuXL7iRI2H1mXEb5Gy8GLtzUYYmanTEKDbAgGa3CViAmHkako8C1L79ZaytcMVthDix1yPHh9PBpkORv7pk+pnAEWh4TJCeex1UMba8JHsQ1gN7QbWai+zgBIb9xqYxMcVFOs8FIC7cjsf3nB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(56012099006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fPXRqV8KGgHpv2+NTtCYqUzbCpi++fC6gZqRf76NHKhJSw3VTLj3Q4nwWLI1?=
 =?us-ascii?Q?LBB8627ZUyQOP+W+NE/IUc7g9lY6a96NuGpC/E48s6c7eVE+hNlpRPMzFe7w?=
 =?us-ascii?Q?jbzx88twhisy/HuhI+9mYW+yiUuuoK+o3Rmk42srGiQalN0YJngOfJAn+8ad?=
 =?us-ascii?Q?lUAUXzwNXvRZNFWfu/tBfgi+HpbqvdqAlFIExOg142fA8S5GkXg6ry+KTRh4?=
 =?us-ascii?Q?G5XNnjasa5k/Vc1hs2sCh+QCkfAaR3u2BngvGotR6GRJHmIK3GM+KZUsSk2A?=
 =?us-ascii?Q?3DMn0/Yrg3qzKNyMYBFslaa9TN1FwW5gS6mntqqLocjwhyOvC9l1bhScfm8W?=
 =?us-ascii?Q?JcLWRZeyWtivTlUVd5N8Avl/r3K5MfubSwISGJucsTH5NR9eRaFrOQks9hU3?=
 =?us-ascii?Q?0uorzGgDKoxRzSfTNMJxJ0tYq/9avd6tTyn8b1hGUaskk9jWmSE/1P505PN3?=
 =?us-ascii?Q?zK+NZ0KoFfU83zc6DPTFvF7m5xJo2q/blM3UckQRSiWOmmXCzpfV3XI5r7lJ?=
 =?us-ascii?Q?ZBCPGYvUj/vPK44jfUEskjDiraCtXEeT5YJDtcxNVPiylfNV2KlcerdEF7Qo?=
 =?us-ascii?Q?AzZl/Y4TAuMLPFfLYGqVlzB2eBv7wJi9XNVMqjXwiFElWgcf7Uz1S1yJen8X?=
 =?us-ascii?Q?YhRvRHyg6oQViSxXKGh7Zst/zukQzBogztWm1EhKc9magmT72E52Rdj1CmuN?=
 =?us-ascii?Q?BNx+605CgmapdSjtEFvTACOrjO+6zZ0Zv62QNV2ChcqA1T3HkEP+hFsTy/IW?=
 =?us-ascii?Q?7wTnfMf2bB3Lf4cTPWErSuvzvomZrc4anUcJxO0Cun8gZQAwP2bsEWg6sRgK?=
 =?us-ascii?Q?2+3T1hXU5ihlEJO2Me/uTRu7EC7mrNBxLY+7s6Nap6UeP4Xuz7bolb8ttCj4?=
 =?us-ascii?Q?ZIUt0hbNfuoeP7WrhBxKP5v4noD/Cp3LTWE9dTTAw6fFSFbIxr7tLXJLmJme?=
 =?us-ascii?Q?0KEyt9KZnwiYXo1KihQc9J5WtFbGYX4+TXBjXd3EHsWCHhUNj4at+LbZbTP/?=
 =?us-ascii?Q?2YwAf4jdVL3hPoQGDrAzrlsfOf3vqZf1wAVrgc6/RbRWDDTn2kplsy5jcXt7?=
 =?us-ascii?Q?br3o4ueYQj9P1fEZNsKIbqrN1WJg84uChfFKQ/GMMlph4VBx+VigfzczN4Xn?=
 =?us-ascii?Q?AxiZBE5fca9woL6A82cQFKtZZA59IXYWN09BjhqpBsqTf369WIjo2sd5NiK3?=
 =?us-ascii?Q?Tv8764gPLNCrKATtzMYoNQ7+EYzclq/3u76SZRvZPMo+AbmRbhBisLdgEvuX?=
 =?us-ascii?Q?eyNQbNqyRYXC0TGWiWhw0OSGV9P62xmb0giI47t/KE8I3wP1cd1IRtKAqE8m?=
 =?us-ascii?Q?kmbmCEh438goRAUo6BObLsz4KQmIVhRWdI3j7hA+Jk6Tk8odsWz/TLqjLXJj?=
 =?us-ascii?Q?Jj12/Pd4yaHRKe3dF0AD1Cnb0SY69wgCbZixQ0AZu/QVtSmnG+bof2IuI2pb?=
 =?us-ascii?Q?HKDVfnWmf76Tm1l9/obTQnPuvK+nne7m5p37P77OrAUYQwmwyKd1YBtqs9wW?=
 =?us-ascii?Q?NhEBWGQmd2vekFd0JPOLDjRuQF7yj0bXuJ64jBHFdwf1l/9VUyt3nWgqB1M0?=
 =?us-ascii?Q?2rPjW4OPQs2Mp5Lvt4Y7l+6v/nA/5ZS9z9aVokSCPxJ24xZFrpJV3Rd1YHNT?=
 =?us-ascii?Q?afk76GE07EetYsN4P3Wk3M8ykyc7bKdJdEzV+DHyGtTjgTA/8Z+su0tWXVJW?=
 =?us-ascii?Q?OXnpdxwTu+Niw97vZrXVtLjr63YHT4CjMXLX69n/hSdLqEn6Z1lW7WJI9KcN?=
 =?us-ascii?Q?bShaVFFM9cecI9aHeWHNZ/dFwwuQk60w5E/OgHz6/QFyp1lRCQHH?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d36fbe9-3d6f-4c5f-4a6c-08dee29a949f
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:57:47.9994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/NIvG/gXa5LSs4yOj3d+B9IhTjuPUlFN8nP+hIGkX33OliotPRZn0g6RufI+iL+aQvID9a+rK7XL92+IwcH2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4406

terminate_all() can deconfigure a channel immediately when it is already
unconfigured, paused, idle, or stopped in hardware. A pending PAUSE
request can survive these paths and block issue_pending() after the
channel is configured again.

Clear request whenever termination leaves the channel deconfigured. A
running channel remains configured while its STOP request is pending, so
the interrupt handler can still consume that request.

Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - New patch for a pre-existing stale request issue. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 8b0e2af734da..2369b4c4630b 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -369,6 +369,8 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
 	} else {
 		chan->request = EDMA_REQ_STOP;
 	}
+	if (!chan->configured)
+		chan->request = EDMA_REQ_NONE;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
 	return err;
-- 
2.51.0


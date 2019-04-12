Return-Path: <SRS0=jDKn=SO=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D17BC10F0E
	for <dmaengine@archiver.kernel.org>; Fri, 12 Apr 2019 08:34:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 60BE020652
	for <dmaengine@archiver.kernel.org>; Fri, 12 Apr 2019 08:34:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="VToswLyn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfDLIeD (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 12 Apr 2019 04:34:03 -0400
Received: from mail-eopbgr1410124.outbound.protection.outlook.com ([40.107.141.124]:50336
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726884AbfDLIeC (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 12 Apr 2019 04:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhdstmL2lBVWKrxNJ/0O8GLZp2k6/8jDfKts7sfU5SI=;
 b=VToswLynJDBX5ryST8p7Ltc3ZEYocBvLPLM8s6KHYHgRWAa2G0RDS+5kN9Fyjtan4We1IZOR52YpmtaXHjbPS+3m9SLVBhhUx7YyqwN42AH8wpgvklwjS4y9YtWTO1pMJErY43dhl3YgqY74DMLmxhFMSn3w/UGm0Y5ZYRDabt4=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB3567.jpnprd01.prod.outlook.com (20.178.137.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Fri, 12 Apr 2019 08:33:59 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1771.016; Fri, 12 Apr 2019
 08:33:59 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "REE dirk.behme@de.bosch.com" <dirk.behme@de.bosch.com>
CC:     "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "Achim.Dahlhoff@de.bosch.com" <Achim.Dahlhoff@de.bosch.com>,
        "REE dirk.behme@de.bosch.com" <dirk.behme@de.bosch.com>,
        "ylhuajnu@outlook.com" <ylhuajnu@outlook.com>,
        HIROYUKI YOKOYAMA <hiroyuki.yokoyama.vx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 1/2] dmaengine: sh: rcar-dmac: With cyclic DMA residue
 0 is valid
Thread-Topic: [PATCH v3 1/2] dmaengine: sh: rcar-dmac: With cyclic DMA residue
 0 is valid
Thread-Index: AQHU8PCvoH1UX+nP30C3l4GRuvgK0qY4Mh9A
Date:   Fri, 12 Apr 2019 08:33:58 +0000
Message-ID:
 <TYAPR01MB427170110F8A8D6822D17F83D8280@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <20190412052914.16006-1-dirk.behme@de.bosch.com>
In-Reply-To: <20190412052914.16006-1-dirk.behme@de.bosch.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac89b144-3c92-4eb3-caf6-08d6bf219be9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3567;
x-ms-traffictypediagnostic: TYAPR01MB3567:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB3567AF254BB92FFF70C4F39CD8280@TYAPR01MB3567.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(346002)(366004)(39860400002)(136003)(189003)(199004)(256004)(52536014)(86362001)(11346002)(33656002)(476003)(68736007)(446003)(97736004)(486006)(5660300002)(4326008)(25786009)(6862004)(53936002)(6246003)(55016002)(9686003)(4744005)(71200400001)(74316002)(71190400001)(305945005)(7736002)(316002)(478600001)(6116002)(81166006)(81156014)(54906003)(8936002)(14454004)(3846002)(102836004)(26005)(186003)(229853002)(66066001)(6436002)(8676002)(6506007)(76176011)(7696005)(106356001)(105586002)(2906002)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3567;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kBrIRYfzL67wYEhcR7+id3mTOHTKHBEsJWWROlbmc/TGxIB5qcX/0zBIZKR0XdjOAs7Befu96iBZZY8zkgLHGT1li4q78qmWNwbm5kic9qC7Om61nOc6zzqa2YZ0uXgw57mziX+hmIWwTY9B2NuIfom8M3h1djKpXAsKpHgr4qjfz1R+uUu7Q6p+jmvIhT2Y0Ipd6zejv2XPd+IduhO2m5kU8g0M7TWCyrxNu5b6SvU9nENnC8+E83NKyuaGj6h4dUsH3QPUylCl0UdZxH08nowqqc8ECrh0dXs65kFo04EqhzgUULQVEE2rLqigxnPz5qj6aX2Op0lYWwH8T3iBeelZ+M4wxS8tTecZ52ws8Fpjf1jgQwe0ttYpA47R+37WyGU99/npkcy3T3HhbeAx53Qpg2n1AR7YjgbqWzv+OmA=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac89b144-3c92-4eb3-caf6-08d6bf219be9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 08:33:58.9099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3567
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190412083358.I-n6U_HjfZ76WjRqCmmZF9g47qSMqH86TtvTnoN6Z4g@z>

Hi Dirk-san,

> From: Dirk Behme, Sent: Friday, April 12, 2019 2:29 PM
>=20
> Having a cyclic DMA, a residue 0 is not an indication of a completed
> DMA. In case of cyclic DMA make sure that dma_set_residue() is called
> and with this a residue of 0 is forwarded correctly to the caller.
>=20
> Fixes: 3544d2878817 ("dmaengine: rcar-dmac: use result of updated get_res=
idue in tx_status")
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> Signed-off-by: Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> Signed-off-by: Yao Lihua <ylhuajnu@outlook.com>
> Cc: <stable@vger.kernel.org> # v4.8+
> ---

Thank you for the patch! Since cyclic transfers will not stop even if
the residue is 0, I agree this driver should not return DMA_COMPLETE
(transaction completed). So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


Return-Path: <SRS0=jDKn=SO=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E855C10F14
	for <dmaengine@archiver.kernel.org>; Fri, 12 Apr 2019 08:52:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3525220818
	for <dmaengine@archiver.kernel.org>; Fri, 12 Apr 2019 08:52:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="NtcPkZhM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfDLIwn (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 12 Apr 2019 04:52:43 -0400
Received: from mail-eopbgr1410128.outbound.protection.outlook.com ([40.107.141.128]:26048
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726616AbfDLIwn (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 12 Apr 2019 04:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9SLJXZ7DkEtArZ2I5Mv8x8lEQTW7iAXAnwH3+vdPp8=;
 b=NtcPkZhMtiUWXcvmPBwA0kjKjQn3NQ3+E1BKmggAx9f8ZxrcFtI/SToCld8+ZwOkiyKJncjQ3hiKFXCO0aSl4nrPaSGsnX7M+YHLi4S+Fyj/o0z6WUKDHNdU1tVWVxH5UsGUsOgVabDYeZEIFVW40V0RCLVTL+Rw5hZ/hqmUziQ=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB2496.jpnprd01.prod.outlook.com (20.177.103.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.18; Fri, 12 Apr 2019 08:52:40 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1771.016; Fri, 12 Apr 2019
 08:52:39 +0000
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
Subject: RE: [PATCH v3 2/2] dmaengine: sh: rcar-dmac: Fix glitch in
 dmaengine_tx_status
Thread-Topic: [PATCH v3 2/2] dmaengine: sh: rcar-dmac: Fix glitch in
 dmaengine_tx_status
Thread-Index: AQHU8PCvkRs/pHNEeU2TUlJSXHQdXKY4NptA
Date:   Fri, 12 Apr 2019 08:52:39 +0000
Message-ID:
 <TYAPR01MB4271FC724A8DAEFF0B69FF16D8280@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <20190412052914.16006-1-dirk.behme@de.bosch.com>
 <20190412052914.16006-2-dirk.behme@de.bosch.com>
In-Reply-To: <20190412052914.16006-2-dirk.behme@de.bosch.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50d3f6b2-7915-4310-ab97-08d6bf243811
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB2496;
x-ms-traffictypediagnostic: TYAPR01MB2496:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB24968611755319E7D22D7214D8280@TYAPR01MB2496.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(136003)(396003)(366004)(346002)(199004)(189003)(11346002)(256004)(99286004)(6506007)(446003)(26005)(478600001)(76176011)(186003)(14454004)(25786009)(7696005)(105586002)(476003)(486006)(97736004)(102836004)(106356001)(81166006)(8676002)(81156014)(229853002)(6436002)(33656002)(305945005)(7736002)(74316002)(68736007)(71190400001)(71200400001)(8936002)(86362001)(4744005)(6246003)(316002)(53936002)(5660300002)(54906003)(3846002)(2906002)(55016002)(6116002)(9686003)(66066001)(6862004)(4326008)(52536014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2496;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tj+qNYelC8zBmNK/OBIYsO58u3uHg786BcIPPCa/nPSief0HuQU/uqzLpFVTzQR3ej65CXu36dcktCRHw8EwyH6uh8R160vq74zq6cyTN0aL518uPqtaUZLKblXQ24FPb3W6aKFpOKkcur+gd/jo5hdN5SnPxgIyrmMrV0LkgEC11hP4npJN3QDpblRJFCeOrLYtFxrIRJOje5tyD+5t6gAZ95/eDhhmZh35crm5PDy4rEGLZZl1+hsMgUQAESWijgB7Wrk8fBwpvuYYiZkZa+uRUk/tKOeXrH75qEaIu9PfGGNVQjckVD1iQRO7/5t0flFxtNiU3ogLzKgrd1eqQDGcgwErXdbeeinrV3lxuy7M0BuWN91kdyyWqo0qKO4nYT0tD+PUlayrmky5MM73/L9RCH+xRxo5TPco/p5FmYg=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d3f6b2-7915-4310-ab97-08d6bf243811
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 08:52:39.8702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2496
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190412085239.EGij1J5BaUBzyszJH4COqBhzmWkYgTd_wFFUCAsvA0U@z>

Hi Dirk-san,

> From: Dirk Behme, Sent: Friday, April 12, 2019 2:29 PM
>=20
> From: Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>
>=20
> The tx_status poll in the rcar_dmac driver reads the status register
> which indicates which chunk is busy (DMACHCRB). Afterwards the point
> inside the chunk is read from DMATCRB. It is possible that the chunk
> has changed between the two reads. The result is a non-monotonous
> increase of the residue. Fix this by introducing a 'safe read' logic.
>=20
> Fixes: 73a47bd0da66 ("dmaengine: rcar-dmac: use TCRB instead of TCR for r=
esidue")

I guess this driver has this issue potencially from previous of the commit
(maybe commit ccadee9b1e9 ("dmaengine: rcar-dmac: Implement support for har=
dware descriptor lists"?).

But, this patch seems good to fix the issue.
So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


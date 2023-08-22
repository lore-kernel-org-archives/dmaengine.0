Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33384EE49A5
	for <dmaengine@archiver.kernel.org>; Tue, 22 Aug 2023 22:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbjHVWM1 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 22 Aug 2023 18:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbjHVWM0 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 22 Aug 2023 18:12:26 -0400
X-Greylist: delayed 902 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 15:12:23 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D179DCF
        for <dmaengine@vger.kernel.org>; Tue, 22 Aug 2023 15:12:23 -0700 (PDT)
X-AuditID: cb7c291e-06dff70000002aeb-86-64e51a58eb0a
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 8B.B2.10987.95A15E46; Wed, 23 Aug 2023 01:28:09 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=Cl/PpsadmHd/zAhReHwI14zvJjQTaxdlqgIkev35OtaYNYws3FXOf/Mc2WS/dqgsu
          q2iwo42yNOGfRsZaFgm5sCLLdI+Mc+a4Ae2YUjfQwGx7sbCv62bC44OcM4KfO71fQ
          4ajgA5Ly/8SQnjt7U3oVkJxPhR6SxcH0FMv623Nuk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=lPdzcb2HL3PIBOyZjuKPrTeRan7zJzEuaNyfqpHlEBq8zAi7d52+AjI6G4efWun53
          BmawbLUTlvKEbLxfVpfYLTlFy/zcUTlfFJE9EEK42r+FSxGWttR739HG4m0955/5z
          vMTVMNAFTPcbalbppI8kh7achkohew7wY9WrKDNWI=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 01:20:19 +0500
Message-ID: <8B.B2.10987.95A15E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     dmaengine@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 13:20:33 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsVyyUKGWzdS6mmKweu9/Barp/5ldWD0+LxJ
        LoAxissmJTUnsyy1SN8ugStjyboLLAW7mSva+hexNDA+Zupi5OCQEDCRWNvg2cXIySEksIdJ
        4vJmsy5GLg4WgdXMEje39jFCOA+ZJeacnsUG4ggJNDNKfO65zQLSwitgLXH/xW5WEJtZQE/i
        xtQpbBBxQYmTM5+wQMS1JZYtfM0Mso1ZQE3ia1cJSFhYQEzi07Rl7CC2iICsxM3va8Fa2QT0
        JVZ8bWYEsVkEVCVudFxgh7hOSmLjlfVsExj5ZyHZNgvJtllIts1C2LaAkWUVo0RxZW4iMNCS
        TfSS83OLE0uK9fJSS/QKsjcxAoPwdI2m3A7GpZcSDzEKcDAq8fD+XPckRYg1sQyo6xCjBAez
        kgiv9PeHKUK8KYmVValF+fFFpTmpxYcYpTlYlMR5bYWeJQsJpCeWpGanphakFsFkmTg4pRoY
        tbe8fbv374avTfd7ZBZK8b57ZuKt7Jdyd/r11ZsnJTUm3Yz0uHJ747F7Fr1zq8s2zz0V2KKo
        PZfh42ShwNjEhKcqny+t/O4o4/hgv06x0USTVWaRzr8OrmO7kPnK7e3Rj4u/pm78uCb3751t
        abwSBTcf9G+cO3GNaplsSemWXF6NVRF87VbNE5VYijMSDbWYi4oTAVgihrc+AgAA
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China


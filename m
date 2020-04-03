Return-Path: <SRS0=FD85=5T=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1E3C2BA15
	for <dmaengine@archiver.kernel.org>; Fri,  3 Apr 2020 17:46:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D756B2173E
	for <dmaengine@archiver.kernel.org>; Fri,  3 Apr 2020 17:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585935964;
	bh=ZRI7NC/u/UbhnTqyAWMZAmd2wwvo9p8ToYmi3Jc1+8Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=c4H6n8d9V78UK+TwZ5NBcLwDq0aGptsUA7eABX2BsY++VqsniPXSa7UyzGS81uOH0
	 GxTdiSFsDd82UYLUkd9Id8gKolcKD5dQb5ERQs/g1bABW4TH0rvy+KjdCd9TlFZCyf
	 cN/yenjH/YsZvw7Gx67LVuI6sOvsEAp9R0bAXDtI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404405AbgDCRqD (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 3 Apr 2020 13:46:03 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43962 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404237AbgDCRqD (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Fri, 3 Apr 2020 13:46:03 -0400
Received: by mail-lf1-f68.google.com with SMTP id n20so6459531lfl.10
        for <dmaengine@vger.kernel.org>; Fri, 03 Apr 2020 10:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mtZk7RTzsQbxV6Wu8be+P9MfgmzeSaSXGSifFFHT7Ng=;
        b=QXLKYEtYIcLWDBH3cTJPT0v99KbYuJ9xLQHPResFlaWKrcu75rRr4FvRPNL4p8q/fP
         dLF6Iwwxq21VvnO/TpA/m/+JYbQc8NNTe4HDyLViiRTog6pfV11mOAWEjYZSRGFeXl+C
         ZJAGE7ACiDjGjSrR0B7X3aDBCrwDDtwh3idLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mtZk7RTzsQbxV6Wu8be+P9MfgmzeSaSXGSifFFHT7Ng=;
        b=HeiOfooTuBkeml6T96WpF7Ja/PjQvcSG3FjhePksDhbIsl1DVSWxakQ3ZNZNVCoUDL
         TSHvyCZZGmwkILyOhPvf/2Bw0FLn0Wee3fBp8/OCEL81AzssF9q9+uH1TvrEfOJW03sE
         zzzxoSvJJBFVNb0P05amGG1gDIYKVkj7r6QE5SZckR+ljXs3Jzvvoyi/k+Ne1qGiUl/q
         fy4vgrH2oV7fzrcQnjdjnkxvCfAMLAByhbBmu38I0KkW7x2ayfDxeZPNQpvw9fZYHqtD
         qypKMz6iQpreOptDrF3pPCPnMoyak7CWu21urNHY0OvDvb9xFjBcHSJf3cckk4mCNM+v
         rORA==
X-Gm-Message-State: AGi0PuZPLQqJmyUbi8gLJ449G/fuwoXrxkcNeKm8cRYrudBHHZgyCL9v
        7RnbXqqeTwp4p7qW8VDh5HBLuGJyzfo=
X-Google-Smtp-Source: APiQypIR0RWPBygomEtOelxhvyoty4VxYHq2dK+lsjJ45FfVxBFzazHC64aG76sDxhHEx2SCwYnVDw==
X-Received: by 2002:ac2:5608:: with SMTP id v8mr6044481lfd.189.1585935960274;
        Fri, 03 Apr 2020 10:46:00 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id t6sm6329569lfb.55.2020.04.03.10.45.59
        for <dmaengine@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 10:45:59 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id h6so6511346lfp.6
        for <dmaengine@vger.kernel.org>; Fri, 03 Apr 2020 10:45:59 -0700 (PDT)
X-Received: by 2002:a19:9109:: with SMTP id t9mr2584555lfd.10.1585935958834;
 Fri, 03 Apr 2020 10:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200403141950.9359-1-peter.ujfalusi@ti.com>
In-Reply-To: <20200403141950.9359-1-peter.ujfalusi@ti.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 3 Apr 2020 10:45:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi-1gB1e1togBo0TJ3QghHvxZhJ9fX069X2+D+N9xhNyQ@mail.gmail.com>
Message-ID: <CAHk-=wi-1gB1e1togBo0TJ3QghHvxZhJ9fX069X2+D+N9xhNyQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ti: k3-udma: Drop COMPILE_TEST for the drivers
 for now
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Vinod Koul <vkoul@kernel.org>, dma <dmaengine@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On Fri, Apr 3, 2020 at 7:19 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>
> Remove the COMPILE_TEST until it is actually possible to compile test the
> drivers.

Ack, of course. Thanks,

              Linus

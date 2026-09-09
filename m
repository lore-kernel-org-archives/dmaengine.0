Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4B02CCB9
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 13:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958948; cv=none; b=IjZRx8a1VRLmpPwsRcXfQvrqa8ZRi9pIKdlyoNQLLsIkt0tRH8JH4IR2of7Wrkw2NVe+Tz8xmNaRp5bth2d6TO257A8TmJGvxR8AV+qUyy4pP15RKJXQ9KNOiJQBmS+wFmqiyP5Ou48xUzm0FqgO3Ij3mOlPB8onao6taD97dr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958948; c=relaxed/simple;
	bh=/C6xrd9DbZMudWsoB9J5FkarnDq/7auYeoCE6cSV8gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJ8Qx73Et9tx/zFcqAh4ONRISeWeYreC2mFHi0Qik7bpoYofeLngTqhjEfOgwkC+vC3mcj8kJkoOGQ8r7sVsZc3afNICJ9I85kN0IHhm/14TYGWaS3R4LQO+VN5V50tQvDwxrRQhKT+qyQBI95C0kq/3nfX/3eMkqcf4MTWt6H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-786c3d55c99so436992137.0
        for <dmaengine@vger.kernel.org>; Wed, 09 Sep 2026 06:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958945; x=1789563745;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nJR6HyF8ZJeLa/LqcU4N2hRWBO69asEjLiBxq381+d4=;
        b=o2OgdMtzJkA/3hrQEWE9R8LoAqAaQE8snp3UVShvpxyjfUHEzg43AXSfk0Cha3/CX1
         VDAUahT/6o8stSWudaaDIaugTPqcMZVA0Icc2HBkdAbvpOpo/20UBoInhueYBNTvMSga
         wHYDFJMpDsOSFlHoMdUfB7OmQZsCyE4Gj2yytaaG/IfE3ZWoyN7yWgbHZb1gbx2cafTe
         8iOIZngIN2WMxKGF58Z3773Wq75r0+DFzaIWQFosGe4iT9sQPKMWOT8m4CyXh8ckF4d2
         0H3XzrO1YIT7djmx9hTjS5qPKFJnAtdfB2mhjJGydAQAbWHGHMvnw4m2Y0/N9gBHA3CO
         zGyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8K7gldFCLDJ/vvIBu5odlOoKGXqyVaTIDgGPWFMd3BckULMhlKm+sWY69DaNFwWjH2fc51XnX2eQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lm5vDgC2BCQYUnGHCl/5Nvy7N8boPVgh6Xaa/oMBkERHF32QER
	sgpjxEB47o6H/D+QtWPp+gsEXS8mQF/IA5n08AnJe+v8j8JNyJOBQOBMHKr6X2SSG6A=
X-Gm-Gg: AYBFou197cNb/2gZ2ldMf5dgpCIbm/RWQSelhMXHpWWcRby4/NiGKLifP2uI4IkiNZT
	QB42iv/9C8j1SfIphYh5IZtSLNr7WXNl2SCe6byKoczPT0A28sDq5yLHOZi2HMvTN4dqCXz1emR
	XEFZbGffReRz2c6mnqbb/o+Z/cmNBtBBwcLBBy51rzFMihFRv7u4CYW2TI9L/u2TFKJoNUq7wVc
	Fr1fa44evV7VHeF7+l6nY455K9VFHgJzV5Y61nLPrbHLAfgsDhisAKWGKLcwE2PM5ks6DryVcs4
	XbAL1f/S29LfdmSHXMxvNNNg2g6g5BEytQcOQhLFN8V1qay2NxM4LMuxUDqLI+a3FME5GnZnq1C
	wuuR8MdLZ7P1i0E8ASV/9WEz4zZGWf6AR5J/lpIRL0c5pARdq1bXB6bSbaExMadDYyyK88VROEK
	Nwv98zARLKHLH1pWMSWsdfzFW5jPgXg0DarSInFnwmayvLTFUBBgYkbJCwdWwXquSEpxUus4LM3
	hw/J8tX3KU0SnQuFeDA2alitbOM6/lcs9eJ
X-Received: by 2002:a05:6102:2c0d:b0:786:56ab:910b with SMTP id ada2fe7eead31-78dd1a1299bmr3486418137.3.1788958944179;
        Wed, 09 Sep 2026 06:02:24 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ae8dd2sm11131557137.8.2026.09.09.06.02.23
        for <dmaengine@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:02:23 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-78a66ef3468so2942756137.0
        for <dmaengine@vger.kernel.org>; Wed, 09 Sep 2026 06:02:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwtT6oJh4PNTVvKLacS5T94q/e8F3HOKWpnoDeiJtC2NrXk4QxiJHB8C/o9ha26Ba3gMlYFGsz8qDc=@vger.kernel.org
X-Received: by 2002:a05:6102:8345:20b0:777:2e1b:1e2e with SMTP id
 ada2fe7eead31-78a2ed7ca4fmr9262680137.3.1788958943502; Wed, 09 Sep 2026
 06:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909094009.2167-6-wsa+renesas@sang-engineering.com> <20260909094009.2167-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260909094009.2167-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 15:02:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJxYsnaenSicPah3cSNXuB3GgQGhZEMcrpeTmmZ73E0w@mail.gmail.com>
X-Gm-Features: AcwNN1UzAXJ6JxDGHbzclDkC6NkeZ4YlTjwaw2VNH8RHPjBoi3xfLyeksmcDlLU
Message-ID: <CAMuHMdVJxYsnaenSicPah3cSNXuB3GgQGhZEMcrpeTmmZ73E0w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dmaengine: sh: rcar-dmac: SMMU doesn't need IPMMU workaround
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 11:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> R-Car Gen5 doesn't use an IPMMU anymore, but a SMMU. So, the workaround
> for the IPMMU becomes optional. Add a flag to distinguish. No functional
> change.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>
> Changes since v1:
> * tags added (Thanks Frank)
> * renamed the flag-variable (Thanks Geert)
> * added a comment that Gen4 might not be affected

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

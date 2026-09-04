Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC694908C0
	for <dmaengine@vger.kernel.org>; Fri,  4 Sep 2026 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526813; cv=none; b=sAAxmy2DqBYL6tJ852xjt6onDnTV2aFVIEruM9LlQ7hl5D2hP/5kdJZwLdP7YRhDf2h1l93/8UFXX48XOpm4GrO9v0laEk+EITyqxGqratHo5cFsDkqEBPy8TA2OZndK7zcQMernfNNMws/KDDqquDeFMrNMfFEbLVdh0sFqABI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526813; c=relaxed/simple;
	bh=b+jsB/SxR9B4doq4j9X1OsN7P3v9KOS03k/c0WlWdws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCxDPIyP2KwdTP7dnVFh0jisW7bhE3nd+52gKe/zmtrTfpE8TK3Fto/7vG285sojKgKhsnBs1EqeG5fA6vPhYqeOu+aJ7ebd9byjWP4bh9WxE5o+zcCSdOCKdqoPfL/N2QyclTqRZN3F8ev0C8brJ4S0t7aeVA/d7QXUQfpS4wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so989027e0c.0
        for <dmaengine@vger.kernel.org>; Fri, 04 Sep 2026 06:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526811; x=1789131611;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d7GgODhxIjczQScbRESMbRZWtgZnkVvNT/nl7txte6o=;
        b=aJuolgQedgwWkxTqPB67575CRIyKdgFLz2PDRc+WGqm+JlG62XdvhNRcsUxYPnL71z
         07fTO989/k6MFeHgX4w0N9qR3bR5MEO2z9jAnMLVj0jLP4scxNpG/lON4khlZ4E7Pavh
         +P+MmNAss8EKTFQ4+KcVcXy/CqbJqiHDILKdlrXuvXV5IOdyblKirWR7l9Asn+LsEtuS
         FZy6ThLCBQqg+Y0YXP7NxCkW4HHYR1um3/wdjQE6ahEnwnFtVX8e73Lko6M2bfhS46Tn
         baq3+i4nkbX9oIj49XizHv0ngZEsAw4vgOeZC7zTFOh8HRcKnmuFSga8bhExlzddlK2O
         6/gw==
X-Forwarded-Encrypted: i=1; AKwUvBxhPR4WUSHOyix1p809LTNn64k7dcuZtf/olC/EGO1eR48gToFj5SiDPAF5tkQnXr9ANa7d/X/ipbg=@vger.kernel.org
X-Gm-Message-State: AFuF++lk1ATXqNEb67xfY5MfCv7bRx7mAdG/cX8ZHrOlGwWcNOfwczQ4
	zDmg3HYifDzdcAPhVDabsLf4ykhfO3t3AGYchdySb0NVIjyCMAVeTLzLHTFsnH+f3pY=
X-Gm-Gg: AYBFou04GBlGQzZ7dGbts1Q4Vh3M20RNFYb/bBvyci0BoqZpyt8Rpmx2YIS6h3pMT3h
	cw/1xV2QlDCt39aegxGlcSeBv7vTS46ElXnydFaTHLb+KJ/d+Tr80A4Ftje4j5wO4SoCjZAQyCE
	sAzRbhUknsJHy34lSWyUG18tRnzACsHdr5A+7GoHmEMWI+nuUd0GyFVzw3WBVZtA7OidJoBXUHu
	+ei+rRGBk/Hl9h5MEfy3yf/X7Iv0b/oAihZZTPgJSy+y4AQ2GlhsXGZ7Y/ErkSbp8vlktUogBc/
	dsVRsD725JgxuPuogo8lFXWk3+KXwSej7k31uwapWPJn6qRgXJCrGDJtMbNWaaNuLWSkBf6Duq3
	RZjVJdvyPBT4bas5dpovzfwihkSRR2sFSJIGNvla3+/x1KNAmAQmXnD1RX6N+0eF3tkla0toCyq
	YdXMIGq+0mjEOs0RGfFCkb3b6lc+8X8Q5w44FVxc1CvrmFzG1Cq/CMqVCQLudiL8AjrbimOGL9+
	yCSrWWXK+w44KcisT8naVWtQQ==
X-Received: by 2002:a05:6122:3a0a:b0:5c7:9947:5ceb with SMTP id 71dfb90a1353d-5c7ed3796d6mr2840992e0c.0.1788526810688;
        Fri, 04 Sep 2026 06:00:10 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef771sm1968228e0c.3.2026.09.04.06.00.09
        for <dmaengine@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:00:09 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-77bf3334d14so688623137.1
        for <dmaengine@vger.kernel.org>; Fri, 04 Sep 2026 06:00:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxoHJ99hOMngXpDkHkPnvE8z5i3L18fmlRdYJ/J5StJPDfqmmabuflGfpULiCswd0u7Dg2kHW0//L4=@vger.kernel.org
X-Received: by 2002:a05:6102:5487:b0:738:1ef6:51b9 with SMTP id
 ada2fe7eead31-78a4a96d8c3mr1844791137.5.1788526809409; Fri, 04 Sep 2026
 06:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com> <20260825141542.30901-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260825141542.30901-9-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 14:59:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTw+rJ4fx+vuM_QdgXE4Bxo2LPX9y0NH3kd7sM2oKcug@mail.gmail.com>
X-Gm-Features: AcwNN1XaEv9Hx-TPYsSjIBjhBVyHhLCKgIrxqOUUTGt6324d-7yS_6EXvarXIyU
Message-ID: <CAMuHMdWTw+rJ4fx+vuM_QdgXE4Bxo2LPX9y0NH3kd7sM2oKcug@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: renesas,rcar-dmac: Add support for R-Car
 X5H SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2026 at 16:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Also add the familiy compatible because X5H is the first R-Car Gen5 SoC.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

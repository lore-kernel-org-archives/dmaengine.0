Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDE92D5925
	for <dmaengine@vger.kernel.org>; Mon,  7 Sep 2026 06:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762573; cv=pass; b=jrE4gI58fS/cVLg/5cR++tscev63YrWFSAZeiPd10GRu/aEXKeyz9vo/uLb93mneupFHSCgVEvo0ssESlEGlAwR88y2K0SNQ5Ai1oQAXWU0ziN9pph9A9bTAsYBETT2hfTvvYh+Ce719Lryh/fbmqnwqH59N41tcv+y507jAtIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762573; c=relaxed/simple;
	bh=ItFKlZKI2V0+J9zr3KnYF7nU8ra+oldkcSW3cENw9yU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGVIovfHYwU5xvWPWAfPGnPbHQGcqG7VyIqQ0qEcSAI6dJQihPp5MUompodJ+2uKDGzqXpfiFhC8DjlwyG2uTQlDKbgqNHrqS60YS1UHO2OdVfCHBz3IN8jUxfHlJxGDNxh5nCL/1/15ArtRyB/f1UG9aitIAts+Py83TVSaoEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=zcEnbdmG; arc=pass smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="zcEnbdmG"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-939a5b1f871so111100085a.0
        for <dmaengine@vger.kernel.org>; Sun, 06 Sep 2026 23:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788762568; cv=none;
        d=google.com; s=arc-20260327;
        b=Hm3Z3kBnZWP0AJpZzswhfLtw2TMIo5bL1dVqXyWFZd7s8GyWt5JQrqoI1k5KUhQJXl
         Ve2fVdRDr/9lk5jNza/MLF18g/3u2egGK5BlGe0rlrJKnBieGQUT8R+jFGAPVjP/d1Ea
         i/mFj5/YmeNIECAN7KSifyH83naUkARnmernsxqltvJ5fseI8FcBnyKk2wxbPJWngvWZ
         XUn/DY3Nggpf4nkuYL9LHoYe+hHpNp6/Z5bKy+o20H+uJ13fIppCBLbGMcvXFcGV6xwm
         RbDFXmnN0TGbx2NdCPrtvvax85VbLo5QRvARthKhXkl+IEwnJSPF1cOQt5U7tLVyDnEW
         PbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+nobZfwyZD6U2aEzKHUENEfOz31yDjT4kqI9cv2dNhE=;
        fh=Ohy2PBOrnffOZXaOEupIWeGxO7VPvKnf1oLMJbTJ1Rk=;
        b=h8MLso1T/1ymbhxpRQb3ajEv2wCPXhUzhEoyRZUcsnJBOeVfI0bqSiLFOvuKmYkJKy
         zGFrv9SZkhZNKUsQFu/C/4BAep7dUlFiWeE7o8aFZGODk2O1/4aAzYJIG4wEzpOA/+NZ
         SjWkmhfclD7/moAnAS1K/v1K7/zNxV0IHn4mxRlH+rbCmRIEGBtuQHxHPxFJ1OD7NCPA
         xQAvjSwBhFSv1Jsp54XhTc4wC8CoXQ4100hLSFL6hajOPQ8ZBtB2FN0NKiql5aP5k7t6
         b4FaW/vAfwQlIujImY0a6vsnLwE1tDIEtWdnJdXrmxSaJbjI5D+TF2QVNXHqW/sSOvDo
         atuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788762568; x=1789367368; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nobZfwyZD6U2aEzKHUENEfOz31yDjT4kqI9cv2dNhE=;
        b=zcEnbdmGSPsDEFHGfiQ78aau/tFzwiSYO0HLvqBPVpcH1R3YFF3glszsRyDdPtvavX
         idy2PoVIZoPwU8HSui5Wa3BDYwqulZA6NMzBDobU6GMIT/VneOS9I8uzcZNFZnNMCbwx
         6zyQ8l8xOpcyOIBKq+tRxW22X9OArZn014Dca5XBWA7YFtB8VmnmgqKayWicG0wVaox8
         ZbBQdfu9fxiFgEVs7G63t6wIM/cm8CAKiJ78Uj8OlJkntXk0i1HKmCiIrEz08bXp2GsK
         1GRLdAO9zOtQbQkVPSUqOxv6+JNIFYUq0zAbqESIo26oEFX7qOQGv+mD1bsnaXhkEks6
         4iUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762568; x=1789367368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+nobZfwyZD6U2aEzKHUENEfOz31yDjT4kqI9cv2dNhE=;
        b=K8OY1QTrpZxn/TMGcpq1XmFBfrSk9IpFpSdzNTB78SJyx5yRVJ3Fk30Ap+2Qt+tfvE
         3fSMJik1o/I0LMn/qbyLxwPZGVRaQeUvPSfXgKxgcbdswLvq60Zygi4JikdJ02czjXbM
         Dvr4mWsyMqn9S1UVjo+YNuEhjOEBdW77usCdAYOQe2oZu6SufYaIzgqhcwhnEr9+30D1
         puNnUmnLV8cxeY+aOtsdm/kzcsfRniy3P0VtAwz/xwwvsD0Vi2iBQW6QxcTui3j+KdR0
         r+Jkb0GZi+Ca6g74CGKWHetOXAnAt6CsLNJOgyxfGqv1oZ328DgddesfpiO7niRBpvOM
         nngg==
X-Forwarded-Encrypted: i=1; AKwUvBwp9+qSpWsEaR4sM9cMpk2JpGYtbB8y7bM9KzgHHWYCdTAw3ZTuJQhL+A80/JRoxWJRcuXb9TWbhds=@vger.kernel.org
X-Gm-Message-State: AFuF++l5v05TmB53X5mdSLLOmjzN9zFcuM1I4sF2t45GYErf1HosKUf/
	dG1bpcakE3hniBp1qU8IMg/uHGtrhXD/ZgY0rWnt50QZ28yKdeEChFjrTuRyUmHbfqyuiIbVJFv
	PX4fOgAQjq3GVz9ZLAoTbgevaSls9NDS76DYLJDAcAg==
X-Gm-Gg: AYBFou2ApDa3bxlmdmn7WmLR8qYhygX+y+2+tKKjmhTYAO3Gs8P+cI6vXGNrw43Xml0
	IoEDu/CYtUPWrOjP7R32/8uKmie0tQl7zTIyGlLsPC+PmCP85y2WOGfZV8xK/f0it5hmtmyjWf3
	QA589LijhJTXFkCv4fsFCqOux/KlbNTFdz1eoKfXxSV6t+HIov9FuyGUhh3iQX6aV/BnmWywbYK
	LFBzmuF0YGgwRiCASo6trjs6dXUarWkckgukgs/zdFFhqg++us3W2swkDpGqUN0nKsphe87PAqO
	y/xSBoWXIuV4AvedTG6yLzRnkKcWKuV4lKXaq3LrP3tuzX9h9i1Bb6Ez8xLho1n8ZqfYzWsdZf2
	I1Lc=
X-Received: by 2002:a05:620a:3943:b0:937:1097:feb8 with SMTP id
 af79cd13be357-93980426539mr2131110985a.24.1788762568248; Sun, 06 Sep 2026
 23:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
 <20260904-acpi-dma-v1-3-0fcc63d65d4b@thegoodpenguin.co.uk> <aprZKXi7h1prHZft@SMW015318>
In-Reply-To: <aprZKXi7h1prHZft@SMW015318>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 7 Sep 2026 07:29:17 +0100
X-Gm-Features: AcwNN1UZJqTHPp0gVwDMba9SMPF841uiWsVn6TpoKEJcXyrTZ-unWt9lXJsg64I
Message-ID: <CAA6zWZ+8=sS1JE4JJORYu45xt6B6VWsf9YXBi4okk_2TdJNUuw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dma: qcom: use named initializers for acpi_device_id
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Remove "While we are at it".  Unify the list ...
>
> and wrap at 75 char, check other patches

Ok thanks - will do this in v2.
